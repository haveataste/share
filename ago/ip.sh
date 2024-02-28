#!/bin/sh
ip=$(curl -s https://api.ip.sb/ip -A Mozilla)
echo "My IP address is: $ip"
