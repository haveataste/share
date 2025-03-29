#!/bin/bash

# 检查是否提供了视频文件作为参数
if [ $# -ne 1 ]; then
    echo "用法: $0 <input_file>"
    exit 1
fi

# 获取输入的视频文件
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"
echo $filename

# 获取视频的总时长（以秒为单位）
duration=$(ffmpeg -i $1 2>&1 | grep "Duration" | cut -d ' ' -f 4 | sed s/,// | sed 's@\..*@@g' | awk '{ split($1, A, ":"); print 3600*A[1] + 60*A[2] + A[3] }')
echo $duration
# 计算分割点
split_point=$((duration / 2))

# 分割视频为第一段
ffmpeg -i $1 -t "$split_point" -c copy "${filename}_01.${extension}"
# 分割视频为第二段
ffmpeg -i $1 -ss "$split_point" -c copy "${filename}_02.${extension}"

echo "视频已成功分割为 ${filename}_01.${extension} 和 ${filename}_02.${extension}" 
