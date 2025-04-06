#!/bin/bash
# compare_chord_churn.sh
# 脚本用于比较不同 churn 参数下 Chord 模拟的性能指标

# 参数设置：根据需要调整
nodeCounts=(64 128)
simTimes=(60.0)
numLookups=(200)
churnRounds=(0 3 5)
churnIntervals=(0 2.0 4.0 6.0)

outputFile="chord_churn_results.csv"
echo "numNodes,simTime,numLookups,churnRounds,churnInterval,LookupAttempts,LookupSuccesses,SuccessRate,AvgLatency,AvgHops" > $outputFile

# 遍历所有参数组合
for n in "${nodeCounts[@]}"; do
  for t in "${simTimes[@]}"; do
    for l in "${numLookups[@]}"; do
      for r in "${churnRounds[@]}"; do
        for i in "${churnIntervals[@]}"; do
          echo "运行模拟：numNodes=${n}, simTime=${t}, numLookups=${l}, churnRounds=${r}, churnInterval=${i}"
          simOutput=$(./ns3 run "chord-sim --numNodes=${n} --simTime=${t} --numLookups=${l} --churnRounds=${r} --churnInterval=${i}" 2>&1)
          
          # 提取关键指标（根据你的输出格式调整 grep/awk 命令）
          lookupAttempts=$(echo "$simOutput" | grep "Lookup Attempts:" | awk '{print $3}')
          lookupSuccess=$(echo "$simOutput" | grep "Lookup Successes:" | awk '{print $3}')
          successRate=$(echo "$simOutput" | grep "Success Rate:" | awk '{print $3}')
          avgLatency=$(echo "$simOutput" | grep "Avg Latency:" | awk '{print $3}')
          avgHops=$(echo "$simOutput" | grep "Avg Hops:" | awk '{print $3}')
          
          # 打印结果并保存到 CSV 文件
          echo "结果: Attempts=${lookupAttempts}, Successes=${lookupSuccess}, Rate=${successRate}, Latency=${avgLatency}s, Hops=${avgHops}"
          echo "${n},${t},${l},${r},${i},${lookupAttempts},${lookupSuccess},${successRate},${avgLatency},${avgHops}" >> $outputFile
          echo "----------------------------------------"
        done
      done
    done
  done
done

echo "所有测试完成，结果保存在 ${outputFile}"
