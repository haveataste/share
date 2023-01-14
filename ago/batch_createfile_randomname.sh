#!/bin/bash
path1=/data/hunk
[ -d ${path1} ] || mkdir -p ${path1} && cd ${path1}
for i in `seq 1 10`
do
RANDOM1=`head -1 /dev/urandom |od  -N 2 | head -1|awk '{print $2}'`
string1=`cat /dev/urandom |sed 's/[^a-zA-Z]'//g|strings -n 2 | head -1`
let n=${RANDOM1}%10+1
touch ${string1}_hunk_${n}.doc
done
