#!/bin/bash

# 获取第一个 CPU 的 governor（假设所有核心使用相同的 governor）
cpu_path="/sys/devices/system/cpu/cpu0/cpufreq"
current_governor=$(cat "$cpu_path/scaling_governor")

# 处理 --set 参数以切换 governor
if [ "$1" == "--set" ]; then
  if [ "$current_governor" == "performance" ]; then
    echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor >/dev/null
    current_governor="powersave"
  else
    echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor >/dev/null
    current_governor="performance"
  fi
fi

# 根据 governor 输出不同的图标和文本
case "$current_governor" in
"performance")
  echo "Perf"
  ;;
"powersave")
  echo "Save"
  ;;
*)
  echo "Unknown"
  ;;
esac
