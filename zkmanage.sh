#!/bin/bash
#循环遍历zookeeper集群中的节点主机名或IP地址
for host in gyq1 gyq2 gyq3
do
#打印当前执行状态提示信息
echo "${host}:${1}ing......"
#ssh连接集群中的其他主机执行相应操作
#source /etc/profile 使自定义环境变量生效 $1为执行脚本时传入的第一个参数
ssh $host "source /etc/profile;zkServer.sh $1"
done
#间隔两秒后检查zookeeper集群各个节点的状态
sleep 2

for host in gyq1 gyq2 gyq3
do
echo "${host}.status:"
ssh $host "source /etc/profile;zkServer.sh status"
done
