/*
 * Copyright (c) 2010 Andrea Sacco
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *
 * Author: Andrea Sacco <andrea.sacco85@gmail.com>
 */

#include "acoustic-modem-energy-model.h"

#include "uan-net-device.h"
#include "uan-phy.h"

#include "ns3/double.h"
#include "ns3/energy-source.h"
#include "ns3/log.h"
#include "ns3/simulator.h"
#include "ns3/trace-source-accessor.h"

namespace ns3
{

NS_LOG_COMPONENT_DEFINE("AcousticModemEnergyModel");

NS_OBJECT_ENSURE_REGISTERED(AcousticModemEnergyModel);

TypeId
AcousticModemEnergyModel::GetTypeId()
{
    static TypeId tid =
        TypeId("ns3::AcousticModemEnergyModel")
            .SetParent<energy::DeviceEnergyModel>()
            .AddConstructor<AcousticModemEnergyModel>()
            .AddAttribute("TxPowerW",
                          "The modem Tx power in Watts",
                          DoubleValue(50),
                          MakeDoubleAccessor(&AcousticModemEnergyModel::SetTxPowerW,
                                             &AcousticModemEnergyModel::GetTxPowerW),
                          MakeDoubleChecker<double>())
            .AddAttribute("RxPowerW",
                          "The modem Rx power in Watts",
                          DoubleValue(0.158),
                          MakeDoubleAccessor(&AcousticModemEnergyModel::SetRxPowerW,
                                             &AcousticModemEnergyModel::GetRxPowerW),
                          MakeDoubleChecker<double>())
            .AddAttribute("IdlePowerW",
                          "The modem Idle power in Watts",
                          DoubleValue(0.158),
                          MakeDoubleAccessor(&AcousticModemEnergyModel::SetIdlePowerW,
                                             &AcousticModemEnergyModel::GetIdlePowerW),
                          MakeDoubleChecker<double>())
            .AddAttribute("SleepPowerW",
                          "The modem Sleep power in Watts",
                          DoubleValue(0.0058),
                          MakeDoubleAccessor(&AcousticModemEnergyModel::SetSleepPowerW,
                                             &AcousticModemEnergyModel::GetSleepPowerW),
                          MakeDoubleChecker<double>())
            .AddTraceSource(
                "TotalEnergyConsumption",
                "Total energy consumption of the modem device.",
                MakeTraceSourceAccessor(&AcousticModemEnergyModel::m_totalEnergyConsumption),
                "ns3::TracedValueCallback::Double");
    return tid;
}

AcousticModemEnergyModel::AcousticModemEnergyModel()
{
    NS_LOG_FUNCTION(this);
    m_currentState = UanPhy::IDLE; // initially IDLE
    m_lastUpdateTime = Seconds(0);
    m_energyDepletionCallback.Nullify();
    m_node = nullptr;
    m_source = nullptr;
}

AcousticModemEnergyModel::~AcousticModemEnergyModel()
{
}

void
AcousticModemEnergyModel::SetNode(Ptr<Node> node)
{
    NS_LOG_FUNCTION(this << node);
    NS_ASSERT(node);
    m_node = node;
}

Ptr<Node>
AcousticModemEnergyModel::GetNode() const
{
    return m_node;
}

void
AcousticModemEnergyModel::SetEnergySource(Ptr<energy::EnergySource> source)
{
    NS_LOG_FUNCTION(this << source);
    NS_ASSERT(source);
    m_source = source;
}

double
AcousticModemEnergyModel::GetTotalEnergyConsumption() const
{
    NS_LOG_FUNCTION(this);
    return m_totalEnergyConsumption;
}

double
AcousticModemEnergyModel::GetTxPowerW() const
{
    NS_LOG_FUNCTION(this);
    return m_txPowerW;
}

void
AcousticModemEnergyModel::SetTxPowerW(double txPowerW)
{
    NS_LOG_FUNCTION(this << txPowerW);
    m_txPowerW = txPowerW;
}

double
AcousticModemEnergyModel::GetRxPowerW() const
{
    NS_LOG_FUNCTION(this);
    return m_rxPowerW;
}

void
AcousticModemEnergyModel::SetRxPowerW(double rxPowerW)
{
    NS_LOG_FUNCTION(this << rxPowerW);
    m_rxPowerW = rxPowerW;
}

double
AcousticModemEnergyModel::GetIdlePowerW() const
{
    NS_LOG_FUNCTION(this);
    return m_idlePowerW;
}

void
AcousticModemEnergyModel::SetIdlePowerW(double idlePowerW)
{
    NS_LOG_FUNCTION(this << idlePowerW);
    m_idlePowerW = idlePowerW;
}

double
AcousticModemEnergyModel::GetSleepPowerW() const
{
    NS_LOG_FUNCTION(this);
    return m_sleepPowerW;
}

void
AcousticModemEnergyModel::SetSleepPowerW(double sleepPowerW)
{
    NS_LOG_FUNCTION(this << sleepPowerW);
    m_sleepPowerW = sleepPowerW;
}

int
AcousticModemEnergyModel::GetCurrentState() const
{
    NS_LOG_FUNCTION(this);
    return m_currentState;
}

void
AcousticModemEnergyModel::SetEnergyDepletionCallback(AcousticModemEnergyDepletionCallback callback)
{
    NS_LOG_FUNCTION(this);
    if (callback.IsNull())
    {
        NS_LOG_DEBUG("AcousticModemEnergyModel:Setting NULL energy depletion callback!");
    }
    m_energyDepletionCallback = callback;
}

void
AcousticModemEnergyModel::SetEnergyRechargeCallback(AcousticModemEnergyRechargeCallback callback)
{
    NS_LOG_FUNCTION(this);
    if (callback.IsNull())
    {
        NS_LOG_DEBUG("AcousticModemEnergyModel:Setting NULL energy recharge callback!");
    }
    m_energyRechargeCallback = callback;
}

void
AcousticModemEnergyModel::ChangeState(int newState)
{
    NS_LOG_FUNCTION(this << newState);
    // NS_ASSERT (IsStateTransitionValid ((MicroModemState) newState));

    Time duration = Simulator::Now() - m_lastUpdateTime;
    NS_ASSERT(duration.GetNanoSeconds() >= 0); // check if duration is valid

    // energy to decrease = current * voltage * time
    double energyToDecrease = 0.0;

    switch (m_currentState)
    {
    case UanPhy::TX:
        energyToDecrease = duration.GetSeconds() * m_txPowerW;
        break;
    case UanPhy::RX:
        energyToDecrease = duration.GetSeconds() * m_rxPowerW;
        break;
    case UanPhy::IDLE:
        energyToDecrease = duration.GetSeconds() * m_idlePowerW;
        break;
    case UanPhy::SLEEP:
        energyToDecrease = duration.GetSeconds() * m_sleepPowerW;
        break;
    case UanPhy::DISABLED:
        energyToDecrease = 0;
        break;
    default:
        NS_FATAL_ERROR("AcousticModemEnergyModel:Undefined radio state!");
    }

    // update total energy consumption
    m_totalEnergyConsumption += energyToDecrease;

    // update last update time stamp
    m_lastUpdateTime = Simulator::Now();

    // notify energy source
    m_source->UpdateEnergySource();

    if (m_currentState != UanPhy::DISABLED)
    {
        // update current state & last update time stamp
        SetMicroModemState(newState);
    }

    // some debug message
    NS_LOG_DEBUG("AcousticModemEnergyModel:Total energy consumption at node #"
                 << m_node->GetId() << " is " << m_totalEnergyConsumption << "J");
}

void
AcousticModemEnergyModel::HandleEnergyDepletion()
{
    NS_LOG_FUNCTION(this);
    NS_LOG_DEBUG("AcousticModemEnergyModel:Energy is depleted at node #" << m_node->GetId());
    // invoke energy depletion callback, if set.
    if (!m_energyDepletionCallback.IsNull())
    {
        m_energyDepletionCallback();
    }
    // invoke the phy energy depletion handler
    Ptr<UanNetDevice> dev = m_node->GetDevice(0)->GetObject<UanNetDevice>();
    dev->GetPhy()->EnergyDepletionHandler();
    SetMicroModemState(UanPhy::DISABLED);
}

void
AcousticModemEnergyModel::HandleEnergyRecharged()
{
    NS_LOG_FUNCTION(this);
    NS_LOG_DEBUG("AcousticModemEnergyModel:Energy is recharged at node #" << m_node->GetId());
    // invoke energy recharge callback, if set.
    if (!m_energyRechargeCallback.IsNull())
    {
        m_energyRechargeCallback();
    }
    // invoke the phy energy recharge handler
    Ptr<UanNetDevice> dev = m_node->GetDevice(0)->GetObject<UanNetDevice>();
    dev->GetPhy()->EnergyRechargeHandler();
    SetMicroModemState(UanPhy::IDLE);
}

void
AcousticModemEnergyModel::HandleEnergyChanged()
{
    NS_LOG_FUNCTION(this);
    // Not implemented
}

/*
 * Private functions start here.
 */

void
AcousticModemEnergyModel::DoDispose()
{
    NS_LOG_FUNCTION(this);
    m_node = nullptr;
    m_source = nullptr;
    m_energyDepletionCallback.Nullify();
}

double
AcousticModemEnergyModel::DoGetCurrentA() const
{
    NS_LOG_FUNCTION(this);

    double supplyVoltage = m_source->GetSupplyVoltage();
    NS_ASSERT(supplyVoltage != 0.0);
    double stateCurrent = 0.0;
    switch (m_currentState)
    {
    case UanPhy::TX:
        stateCurrent = m_txPowerW / supplyVoltage;
        break;
    case UanPhy::RX:
        stateCurrent = m_rxPowerW / supplyVoltage;
        break;
    case UanPhy::IDLE:
        stateCurrent = m_idlePowerW / supplyVoltage;
        break;
    case UanPhy::SLEEP:
        stateCurrent = m_sleepPowerW / supplyVoltage;
        break;
    case UanPhy::DISABLED:
        stateCurrent = 0.0;
        break;
    default:
        NS_FATAL_ERROR("AcousticModemEnergyModel:Undefined radio state!");
    }

    return stateCurrent;
}

bool
AcousticModemEnergyModel::IsStateTransitionValid(const int destState)
{
    NS_LOG_FUNCTION(this << destState);
    return true;
}

void
AcousticModemEnergyModel::SetMicroModemState(const int state)
{
    NS_LOG_FUNCTION(this);
    if (IsStateTransitionValid(state))
    {
        m_currentState = state;
        std::string stateName;
        switch (state)
        {
        case UanPhy::TX:
            stateName = "TX";
            break;
        case UanPhy::RX:
            stateName = "RX";
            break;
        case UanPhy::IDLE:
            stateName = "IDLE";
            break;
        case UanPhy::SLEEP:
            stateName = "SLEEP";
            break;
        case UanPhy::DISABLED:
            stateName = "DISABLED";
            break;
        }
        NS_LOG_DEBUG("AcousticModemEnergyModel:Switching to state: " << stateName << " at time = "
                                                                     << Simulator::Now());
    }
    else
    {
        NS_FATAL_ERROR("AcousticModemEnergyModel:Invalid state transition!");
    }
}

} // namespace ns3
