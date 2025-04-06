import pandas as pd
import matplotlib.pyplot as plt

# 读取 CSV 数据文件（请确保 CSV 文件与脚本在同一目录，文件名为 chord_churn_results.csv）
df = pd.read_csv('chord_churn_results.csv')

# 按 numNodes 分组
df64 = df[df['numNodes'] == 64]
df128 = df[df['numNodes'] == 128]

# 获取 churnRounds 与 churnInterval 的唯一值
churnRounds_values = sorted(df['churnRounds'].unique())  # 0, 3, 5
churnInterval_values = sorted(df['churnInterval'].unique())  # 0, 3.0, 6.0

# ---------------------------
# 图1：查找成功率（Lookup Success Rate）
# ---------------------------
plt.figure(figsize=(10, 5))
# 对 64 个节点的情况绘制曲线
for r in churnRounds_values:
    subset = df64[df64['churnRounds'] == r]
    plt.plot(subset['churnInterval'], subset['SuccessRate'], marker='o', label=f'64 nodes, churnRounds={r}')
# 对 128 个节点的情况绘制曲线
for r in churnRounds_values:
    subset = df128[df128['churnRounds'] == r]
    plt.plot(subset['churnInterval'], subset['SuccessRate'], marker='s', linestyle='--', label=f'128 nodes, churnRounds={r}')
plt.xlabel('churnInterval')
plt.ylabel('Lookup Success Rate')
plt.title('Lookup Success Rate vs churnInterval')
plt.legend()
plt.grid(True)
plt.savefig('lookup_success_rate.png')
plt.show()

# ---------------------------
# 图2：平均延迟（Avg Latency）
# ---------------------------
plt.figure(figsize=(10, 5))
# 绘制 64 个节点数据
for r in churnRounds_values:
    subset = df64[df64['churnRounds'] == r]
    plt.plot(subset['churnInterval'], subset['AvgLatency'], marker='o', label=f'64 nodes, churnRounds={r}')
# 绘制 128 个节点数据
for r in churnRounds_values:
    subset = df128[df128['churnRounds'] == r]
    plt.plot(subset['churnInterval'], subset['AvgLatency'], marker='s', linestyle='--', label=f'128 nodes, churnRounds={r}')
plt.xlabel('churnInterval')
plt.ylabel('Avg Latency (s)')
plt.title('Avg Latency vs churnInterval')
plt.legend()
plt.grid(True)
plt.savefig('avg_latency.png')
plt.show()

# ---------------------------
# 图3：平均跳数（Avg Hops）
# ---------------------------
plt.figure(figsize=(10, 5))
# 绘制 64 个节点数据
for r in churnRounds_values:
    subset = df64[df64['churnRounds'] == r]
    plt.plot(subset['churnInterval'], subset['AvgHops'], marker='o', label=f'64 nodes, churnRounds={r}')
# 绘制 128 个节点数据
for r in churnRounds_values:
    subset = df128[df128['churnRounds'] == r]
    plt.plot(subset['churnInterval'], subset['AvgHops'], marker='s', linestyle='--', label=f'128 nodes, churnRounds={r}')
plt.xlabel('churnInterval')
plt.ylabel('Avg Hops')
plt.title('Avg Hops vs churnInterval')
plt.legend()
plt.grid(True)
plt.savefig('avg_hops.png')
plt.show()
