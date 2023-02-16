#!/bin/bash

#no blank space
a=10;b=17
echo $a $b
echo $(($a+$b)) $(($b/$a))
s="Hello,my friend"
echo $s
echo ${#s}        #string long
echo ${s#Hel*,}   #split

echo '--------------------'
filename=$HOME/linux/shell/test.sh
echo $filename
test -f $filename && echo "yes" || echo 'no'
test -d $filename && echo "yes" || echo 'no'
test -r $filename && echo "yes" || echo 'no'
test -w $filename && echo "yes" || echo 'no'
test -x $filename && echo "yes" || echo 'no'

if [ $a = $b ];then
echo 'equal'
else
echo 'unequal'
fi

if [ 3 -gt 2 ];then
echo 'a'
else
echo 'b'
fi

echo 'please input a number:'
read num
if [ $num = 1 ];then
echo 'A'
cat /proc/cpuinfo
elif [ $num = 2 ];then
echo 'B'
cat /proc/meminfo
elif [ $num = 3 ];then
echo 'C'
cat /proc/version
else
echo 'D'
df -h
fi

echo 'please input a number:'
read num
case $num in
1)
echo 'A'
cat /proc/cpuinfo;;
2)
echo 'B'
cat /proc/meminfo;;
3)
echo 'C'
cat /proc/version;;
*)
echo 'D'
df -h;;
esac

case $1 in
1)
echo a;;
2)
echo b;;
3)
echo c;;
esac

echo '--------------------'
a=5
while [ $a -gt 0 ]
do
echo $a
a=$(($a-1))
done

for i in 1 2 3 4 5; do echo $i; done
for((i=1;i<6;i++)); do echo $i; done
for i in `seq 1 5`; do echo $i; done

echo $# $0 $1 $2 $$

# 一些程序从标准输入stdin中获取输入。默认情况下，标准输入与键盘相连接。
# 输出包括两种类型：程序的结果，被称为标准输出或者stdout。状态以及错误信息，被称为标准错误或者stderr。
# 默认情况下，stdout和stderr 都被链接到屏幕上，而不是保存到文件中。重定向允许我们改变输出的去向和输入的来源。
cat fn > a.txt
cat fn >> a.txt
cat < a.txt
cat << a
cat fn 2> error.txt
cat fn &> all.txt
cat fn > all.txt 2>&1
