#!/bin/bash

pid=$(ps -ef | grep "webstorage_sync" | grep -v grep | awk '{print $2}')
if [ -n "$pid" ]; then
    kill -9 $pid
fi
if [ -d ~/.ASUS ]; then
    rm -rf ~/.ASUS/
fi
if [ -d /mnt/asus ]; then
    sudo umount -f /mnt/asus || true
    sudo rm -rf /mnt/asus
fi

# 20250324 mount tmpfs
sudo mkdir -p /mnt/asus
sudo mount -t tmpfs -o size=4G tmpfs /mnt/asus
cd /mnt/asus/

# 20250329 ASUS Webstorage linux client
curl -sSL -O https://raw.githubusercontent.com/haveataste/share/refs/heads/master/asus/asus.zip
unzip asus.zip && rm -rf asus.zip
./webstorage_main_process start
./webstorage_main_process status
#./webstorage_main_process getlog
# 将文件放置 ./asus/myarpanet@protonmail.com/MySyncFolder/ 中，会自动同步到网盘，但是要注意文件的读写权限
# 同样，在网盘中删除文件，也会自动删除本地文件
# 无法上传大于500M的文件, 可将视频文件按时长大概裁剪成两个视频段
# split -a 2 -b 350M -d fn.mp4 fn

# 20250330
# 上午终于将MEGA里资源整理完毕，将电脑上所有视频资源上传到ASUS
# Use space 122.68 GB / 1005.0 GB (12.2%) 

cd /mnt/asus/myarpanet@protonmail.com/MySyncFolder/
if ! python -c "import requests" &> /dev/null; then
    pip3 install requests
fi
if ! python -c "import redis" &> /dev/null; then
    pip3 install redis
fi
if ! command -v ffmpeg &>/dev/null; then
    sudo apt install ffmpeg -y
fi
curl -O https://raw.githubusercontent.com/haveataste/share/refs/heads/master/asus/uag.py
#curl -O https://raw.githubusercontent.com/haveataste/share/refs/heads/master/vf.sh
