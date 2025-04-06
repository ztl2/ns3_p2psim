#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/csma-module.h"
#include "ns3/applications-module.h"
#include <vector>
#include <cmath>
#include <cstdint>
#include <cstring>

using namespace ns3;

NS_LOG_COMPONENT_DEFINE("ChordSim");

static const uint16_t CHORD_PORT = 9000;

// 全局统计变量
uint32_t g_lookupAttempts = 0;
uint32_t g_lookupSuccess = 0;
double g_totalLatency = 0.0;
uint32_t g_totalHops = 0;

// 全局节点 IP 映射（下标即节点的 Chord id）
std::vector<Ipv4Address> g_nodeAddresses;
uint32_t g_numNodes = 64;

// 计算环的大小：取 m = ceil(log2(numNodes))，环大小 = 2^m
uint32_t GetRingSize(uint32_t numNodes) {
    uint32_t m = std::ceil(std::log2(numNodes));
    return 1 << m;
}

// 判断 key 是否落在 (start, end] 区间（环形比较）
bool InInterval(uint32_t key, uint32_t start, uint32_t end, bool inclusiveEnd = true) {
    uint32_t ringSize = GetRingSize(g_numNodes);
    if (start < end) {
        return inclusiveEnd ? (key > start && key <= end) : (key > start && key < end);
    } else if (start > end) { // 跨环情况
        return inclusiveEnd ? (key > start || key <= end) : (key > start || key < end);
    } else {
        return true;
    }
}

// --- 自定义 Chord 消息结构 ---
// 数据包总大小为 21 字节：
// [0]    消息类型 (uint8_t)：0 = lookup 请求，1 = lookup 回复
// [1-4]  查找键 (uint32_t)
// [5-8]  发起者 IP (uint32_t，网络字节序)
// [9-16] 时间戳 (uint64_t)
// [17-20] 跳数 (uint32_t)
struct ChordPacket {
    uint8_t type;
    uint32_t key;
    uint32_t originIp;
    uint64_t timestamp;
    uint32_t hopCount;
};

static const uint32_t CHORD_PACKET_SIZE = 21;

void PackChordPacket(const ChordPacket &pkt, uint8_t *buffer) {
    buffer[0] = pkt.type;
    std::memcpy(buffer + 1, &pkt.key, sizeof(uint32_t));
    std::memcpy(buffer + 5, &pkt.originIp, sizeof(uint32_t));
    std::memcpy(buffer + 9, &pkt.timestamp, sizeof(uint64_t));
    std::memcpy(buffer + 17, &pkt.hopCount, sizeof(uint32_t));
}

void UnpackChordPacket(const uint8_t *buffer, ChordPacket &pkt) {
    pkt.type = buffer[0];
    std::memcpy(&pkt.key, buffer + 1, sizeof(uint32_t));
    std::memcpy(&pkt.originIp, buffer + 5, sizeof(uint32_t));
    std::memcpy(&pkt.timestamp, buffer + 9, sizeof(uint64_t));
    std::memcpy(&pkt.hopCount, buffer + 17, sizeof(uint32_t));
}

// --- 简单的 churn 行为函数 ---
// 在 LeaveNode 中关闭节点的应用层 Socket，从而模拟节点下线
void LeaveNode(Ptr<Node> node) {
    // 获取该节点上绑定的所有 Socket（假设只有一个 Chord 应用）
    Ptr<Ipv4> ipv4 = node->GetObject<Ipv4>();
    // 此处假设关闭所有设备通信（更复杂的情形下可以具体关闭应用）
    ipv4->SetDown(1);
    NS_LOG_INFO("Node " << node->GetId() << " LEFT at " << Simulator::Now().GetSeconds());
}

// 在 JoinNode 中重新启用节点通信
void JoinNode(Ptr<Node> node) {
    Ptr<Ipv4> ipv4 = node->GetObject<Ipv4>();
    ipv4->SetUp(1);
    NS_LOG_INFO("Node " << node->GetId() << " JOINED at " << Simulator::Now().GetSeconds());
}

void ChurnBehavior(Ptr<Node> node, uint32_t rounds, double interval) {
    if (rounds == 0) return;
    Simulator::Schedule(Seconds(0.1), &LeaveNode, node);
    Simulator::Schedule(Seconds(interval), &JoinNode, node);
    Simulator::Schedule(Seconds(2 * interval), &ChurnBehavior, node, rounds - 1, interval);
}

// --- Chord 应用 ---
class ChordApp : public Application {
public:
    ChordApp();
    virtual ~ChordApp();
    
    // 参数：本节点的 Chord id，总节点数，以及全局 IP 映射
    void Setup(uint32_t chordId, uint32_t numNodes, const std::vector<Ipv4Address> &nodeAddrs);

    // 发起一次查找
    void InitiateLookup(uint32_t key);

private:
    virtual void StartApplication(void);
    virtual void StopApplication(void);
    
    // 接收回调
    void HandleRead(Ptr<Socket> socket);
    // 处理收到的 lookup 请求
    void ProcessLookup(const ChordPacket &pkt, const Address &from);
    // 根据 finger table 转发 lookup 请求
    void ForwardLookup(const ChordPacket &pkt);
    
    // 根据 finger table 寻找下一跳
    uint32_t GetNextHop(uint32_t key);

    Ptr<Socket> m_socket;
    uint32_t m_chordId; // 本节点的 Chord id
    uint32_t m_numNodes; // 总节点数
    std::vector<uint32_t> m_fingerTable; // finger table，大小 m = ceil(log2(numNodes))
    std::vector<Ipv4Address> m_nodeAddresses; // 全局节点 IP 映射
};

ChordApp::ChordApp()
: m_socket(0),
  m_chordId(0),
  m_numNodes(0)
{
}

ChordApp::~ChordApp() {
    m_socket = 0;
}

void ChordApp::Setup(uint32_t chordId, uint32_t numNodes, const std::vector<Ipv4Address> &nodeAddrs) {
    m_chordId = chordId;
    m_numNodes = numNodes;
    m_nodeAddresses = nodeAddrs;
    uint32_t ringSize = GetRingSize(numNodes);
    uint32_t m = std::ceil(std::log2(numNodes));
    m_fingerTable.resize(m);
    // finger[i] = 第一个 ID ≥ (m_chordId + 2^i) mod ringSize 的节点
    for (uint32_t i = 0; i < m; i++) {
        uint32_t start = (m_chordId + (1 << i)) % ringSize;
        // 假设所有 ID [0, numNodes-1] 均存在
        m_fingerTable[i] = (start < numNodes) ? start : 0;
    }
    NS_LOG_INFO("Node " << m_chordId << " Finger Table:");
    for (uint32_t i = 0; i < m_fingerTable.size(); i++) {
        NS_LOG_INFO("  Entry " << i << " : " << m_fingerTable[i]);
    }
}

void ChordApp::StartApplication(void) {
    if (!m_socket) {
        m_socket = Socket::CreateSocket(GetNode(), UdpSocketFactory::GetTypeId());
        InetSocketAddress local = InetSocketAddress(Ipv4Address::GetAny(), CHORD_PORT);
        m_socket->Bind(local);
        m_socket->SetRecvCallback(MakeCallback(&ChordApp::HandleRead, this));
    }
}

void ChordApp::StopApplication(void) {
    if (m_socket) {
        m_socket->Close();
        m_socket = 0;
    }
}

void ChordApp::HandleRead(Ptr<Socket> socket) {
    Address from;
    Ptr<Packet> packet = socket->RecvFrom(from);
    if (packet->GetSize() < CHORD_PACKET_SIZE) {
        NS_LOG_WARN("Received packet of insufficient size");
        return;
    }
    uint8_t buffer[CHORD_PACKET_SIZE];
    packet->CopyData(buffer, CHORD_PACKET_SIZE);
    ChordPacket pkt;
    UnpackChordPacket(buffer, pkt);
    
    if (pkt.type == 0) { // lookup 请求
        ProcessLookup(pkt, from);
    } else if (pkt.type == 1) { // lookup 回复
        uint64_t now = Simulator::Now().GetMicroSeconds();
        double latency = (now - pkt.timestamp) / 1e6;
        g_totalLatency += latency;
        g_totalHops += pkt.hopCount;
        g_lookupSuccess++;
        NS_LOG_INFO("Node " << m_chordId << " received reply for key " 
                    << pkt.key << " after " << pkt.hopCount 
                    << " hops, latency: " << latency << " s");
    }
}

void ChordApp::ProcessLookup(const ChordPacket &pkt, const Address &from) {
    ChordPacket newPkt = pkt;
    newPkt.hopCount++; // 每转发一次跳数加 1

    // 简单假设：若本节点 ID 与查找键相等，则认为本节点负责该键
    if (m_chordId == pkt.key) {
        newPkt.type = 1; // reply 类型
        Ipv4Address originIp = Ipv4Address(pkt.originIp);
        InetSocketAddress dest = InetSocketAddress(originIp, CHORD_PORT);
        uint8_t buf[CHORD_PACKET_SIZE];
        PackChordPacket(newPkt, buf);
        Ptr<Packet> replyPacket = Create<Packet>(buf, CHORD_PACKET_SIZE);
        m_socket->SendTo(replyPacket, 0, dest);
        NS_LOG_INFO("Node " << m_chordId << " is responsible for key " << pkt.key 
                    << ". Sending reply to " << originIp);
    } else {
        ForwardLookup(newPkt);
    }
}

void ChordApp::ForwardLookup(const ChordPacket &pkt) {
    uint32_t nextHop = GetNextHop(pkt.key);
    // 若选到本节点，则选择直接后继
    if (nextHop == m_chordId) {
        nextHop = (m_chordId + 1) % m_numNodes;
    }
    Ipv4Address nextHopAddr = m_nodeAddresses[nextHop];
    InetSocketAddress dest = InetSocketAddress(nextHopAddr, CHORD_PORT);
    uint8_t buf[CHORD_PACKET_SIZE];
    PackChordPacket(pkt, buf);
    Ptr<Packet> forwardPacket = Create<Packet>(buf, CHORD_PACKET_SIZE);
    m_socket->SendTo(forwardPacket, 0, dest);
    NS_LOG_INFO("Node " << m_chordId << " forwarding lookup for key " 
                << pkt.key << " to node " << nextHop);
}

uint32_t ChordApp::GetNextHop(uint32_t key) {
    uint32_t nextHop = m_chordId;
    // 从 finger table 倒序查找，选择小于 key 的最大 finger
    for (int i = m_fingerTable.size() - 1; i >= 0; i--) {
        uint32_t fingerId = m_fingerTable[i];
        if (m_chordId < key) {
            if (fingerId > m_chordId && fingerId < key) {
                nextHop = fingerId;
                break;
            }
        } else { // 跨环情况
            if (fingerId > m_chordId || fingerId < key) {
                nextHop = fingerId;
                break;
            }
        }
    }
    return nextHop;
}

void ChordApp::InitiateLookup(uint32_t key) {
    ChordPacket pkt;
    pkt.type = 0; // lookup 请求
    pkt.key = key;
    Ipv4Address myIp = m_nodeAddresses[m_chordId];
    pkt.originIp = myIp.Get();
    pkt.timestamp = Simulator::Now().GetMicroSeconds();
    pkt.hopCount = 0;
    if (m_chordId == key) {
        NS_LOG_INFO("Node " << m_chordId << " initiating lookup for key " << key 
                    << " and is responsible itself.");
        // 自回复
        pkt.type = 1;
        uint8_t buf[CHORD_PACKET_SIZE];
        PackChordPacket(pkt, buf);
        Ptr<Packet> packet = Create<Packet>(buf, CHORD_PACKET_SIZE);
        m_socket->Send(packet);
    } else {
        NS_LOG_INFO("Node " << m_chordId << " initiating lookup for key " << key);
        ForwardLookup(pkt);
    }
    g_lookupAttempts++;
}

// --- 主函数 ---
int main (int argc, char *argv[]) {
    // 默认参数，可通过命令行覆盖
    uint32_t numNodes = 64;
    double simTime = 60.0;
    uint32_t numLookups = 200;
    uint32_t churnRounds = 0;
    double churnInterval = 0.0;

    CommandLine cmd;
    cmd.AddValue("numNodes", "Number of Chord nodes", numNodes);
    cmd.AddValue("simTime", "Simulation duration", simTime);
    cmd.AddValue("numLookups", "Total number of lookup attempts", numLookups);
    cmd.AddValue("churnRounds", "Number of churn rounds per node", churnRounds);
    cmd.AddValue("churnInterval", "Interval for churn events", churnInterval);
    cmd.Parse(argc, argv);
    g_numNodes = numNodes;

    // 创建节点
    NodeContainer nodes;
    nodes.Create(numNodes);

    // 安装协议栈
    InternetStackHelper internet;
    internet.Install(nodes);

    // 使用 CSMA 构建局域网，确保所有节点互联
    CsmaHelper csma;
    csma.SetChannelAttribute("DataRate", StringValue("100Mbps"));
    csma.SetChannelAttribute("Delay", TimeValue(MilliSeconds(2)));
    NetDeviceContainer devices = csma.Install(nodes);

    // 分配 IP 地址
    Ipv4AddressHelper ipv4;
    ipv4.SetBase("10.1.1.0", "255.255.255.0");
    Ipv4InterfaceContainer interfaces = ipv4.Assign(devices);

    // 构建全局节点 IP 映射：假设节点 i 的 Chord id 为 i
    g_nodeAddresses.resize(numNodes);
    for (uint32_t i = 0; i < numNodes; i++) {
        g_nodeAddresses[i] = interfaces.GetAddress(i);
        NS_LOG_INFO("Node " << i << " IP: " << g_nodeAddresses[i]);
    }

    // 在每个节点上安装 Chord 应用
    ApplicationContainer chordApps;
    for (uint32_t i = 0; i < numNodes; i++) {
        Ptr<ChordApp> app = CreateObject<ChordApp>();
        app->Setup(i, numNodes, g_nodeAddresses);
        nodes.Get(i)->AddApplication(app);
        app->SetStartTime(Seconds(1.0));
        app->SetStopTime(Seconds(simTime));
        chordApps.Add(app);
    }

    // 调度查找事件：随机选择发起查找的节点和查找键（键范围为 [0, ringSize-1]）
    Ptr<UniformRandomVariable> randVar = CreateObject<UniformRandomVariable>();
    uint32_t ringSize = GetRingSize(numNodes);
    for (uint32_t i = 0; i < numLookups; i++) {
        double t = 2.0 + randVar->GetValue(0, simTime - 2.0);
        uint32_t src = randVar->GetInteger(0, numNodes - 1);
        uint32_t key = randVar->GetInteger(0, ringSize - 1);
        Simulator::Schedule(Seconds(t), [src, key, chordApps]() {
            Ptr<ChordApp> app = DynamicCast<ChordApp>(chordApps.Get(src));
            if (app) {
                app->InitiateLookup(key);
            }
        });
    }

    // 如果设置了 churn 参数（churnRounds > 0 且 churnInterval > 0），随机选择部分节点安排 churn 事件
    if (churnRounds > 0 && churnInterval > 0) {
        Ptr<UniformRandomVariable> churnRand = CreateObject<UniformRandomVariable>();
        for (uint32_t i = 0; i < numNodes; i++) {
            // 以一定概率（例如 30%）让该节点参与 churn
            double p = churnRand->GetValue(0.0, 1.0);
            if (p < 0.3) {
                // 随机选择 churn 开始时间，确保在模拟时间内完成所有 churn 轮次
                double startTime = churnRand->GetValue(5.0, simTime - churnRounds * churnInterval * 2);
                Simulator::Schedule(Seconds(startTime), &ChurnBehavior, nodes.Get(i), churnRounds, churnInterval);
                NS_LOG_INFO("Node " << i << " scheduled for churn starting at " << startTime << "s");
            }
        }
    }

    Simulator::Stop(Seconds(simTime));
    Simulator::Run();
    Simulator::Destroy();

    std::cout << "=== Chord Simulation Results ===" << std::endl;
    std::cout << "Lookup Attempts: " << g_lookupAttempts << std::endl;
    std::cout << "Lookup Successes: " << g_lookupSuccess << std::endl;
    double successRate = (g_lookupAttempts > 0) ? (double)g_lookupSuccess / g_lookupAttempts : 0.0;
    std::cout << "Success Rate: " << successRate << std::endl;
    double avgLatency = (g_lookupSuccess > 0) ? g_totalLatency / g_lookupSuccess : 0.0;
    std::cout << "Avg Latency: " << avgLatency << " s" << std::endl;
    double avgHops = (g_lookupSuccess > 0) ? (double)g_totalHops / g_lookupSuccess : 0.0;
    std::cout << "Avg Hops: " << avgHops << std::endl;

    return 0;
}
