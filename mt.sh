#!/bin/bash
# mount tmpfs 20250324
sudo mkdir -p /mnt/tf
sudo mount -t tmpfs -o size=2G tmpfs /mnt/tf
cd /mnt/tf/
