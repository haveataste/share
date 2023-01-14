#!/bin/bash
#by leo108
#ʹ�÷�ʽ��./genpwd.sh �������� ���볤�� �����ļ�
#�������������1����������+��ĸ�������������������
#����./genpwd.sh 1 4 pwd.txt�����ɳ���Ϊ4������+��ĸ����
type=$1
length=$2
f=$3
if [ $type -eq "1" ]; then
g_Dict=( 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z )
else
g_Dict=( 0 1 2 3 4 5 6 7 8 9 )
fi
count=0
total=1
if [ -e tmp.txt ]; then
    rm tmp.txt
fi
for ((i=0;i<$length;i++));
do
    let "total*=${#g_Dict[@]}"
done
echo "Total:"$total
declare -a Dict
declare -a Array
bStop=1
for ((i=0;i<$length;i++));
do
    Array[$i]=0
done
while [ $bStop != 0 ]; do
    for ((i=0;i<$length;i++));
    do
        Dict[$i]=${g_Dict[${Array[$i]}]}
    done
    echo ${Dict[@]} >> tmp.txt
    let "count+=1"
    let "tmp=count%10000"
    if [ $tmp -eq 0 ]; then
        echo $count" Generated"
    fi
    for ((j=$length-1;j>=0;j--));
    do
        let "Array[$j]+=1"
        if [ ${#g_Dict[@]} -ne ${Array[$j]} ]; then
            break
        else
            Array[$j]=0
            if [ $j -eq 0 ]; then
                bStop=0
            fi
        fi
    done
done
sed -r 's/ +//g' tmp.txt >> $f
echo "Finish"
rm tmp.txt