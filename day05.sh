#!/bin/bash
# 数据库SQL脚本应用
# 1、登录数据库
#MYSQL=$(which mysql)
#$MYSQL -h 127.0.0.1 -u root

# 2、查询数据库表
# $MYSQL 后面跟的是当前需要查询的数据库 -e 后面跟sel语句
# 写法一
#MYSQL=$(which mysql)
#$MYSQL suhc -h 127.0.0.1 -u root -e "select * from user;"
# 写法二：利用开始标记和结束标记>输入重定向
#MYSQL=$(which mysql)
#$MYSQL suhc -h 127.0.0.1 -u root << EOF
#select * from user;
#EOF

# 3、插入数据到数据库表
# 案例一：需要插入的数据写死
#MYSQL=$(which mysql)
#$MYSQL suhc -h 127.0.0.1 -u root << EOF
#insert into user (username, sex, address) values ('shell_001', '男', '北京市朝阳区');
#EOF
# 案例二：动态获取需要插入的数据，并且SQL执行状态
#MYSQL=$(which mysql)
## $#获取参数个数 -ne是否不等于
#if [ $# -ne 3 ]
#then
#    echo "参数个数不对，必须是3个参数"
#else
## 插入数据
#$MYSQL suhc -h 127.0.0.1 -u root << EOF
#    insert into user (username, sex, address) values ("$1", "$2", "$3");
#EOF
## 获取SQL状态 $?获取上个指定的执行状态 -eq是否等于 等于0代表上个指令执行成功
#if [ $? -eq 0 ]
#then
#echo "插入成功"
#else
#echo "插入失败"
#fi
#fi
# 案例三：从用户输入动态获取需要插入的数据，并且SQL执行状态
#read -p "请输入用户名：" username
#until [ -n "$username" ]
#do
#read -p "用户名不能为空，请重新输入：" username
#done
#
#read -p "请输入性别(男/女)：" sex
#until [ -n "$sex" ]
#do
#read -p "性别不能为空，请重新输入：" sex
#done
#
#until [ "$sex" = "男" -o "$sex" = "女" ]
#do
#read -p "性别格式不对，请重新输入：" sex
#done
#
#read -p "请输入地址：" address
#until [ -n "$address" ]
#do
#read -p "地址不能为空，请重新输入：" address
#done
#
#MYSQL=$(which mysql)
## 插入数据
#$MYSQL suhc -h 127.0.0.1 -u root << EOF
#insert into user (username, sex, address) values ("$username", "$sex", "$address");
#EOF
## 获取SQL状态 $?获取上个指定的执行状态 -eq是否等于 等于0代表上个指令执行成功
#if [ $? -eq 0 ]
#then
#echo "插入成功"
#else
#echo "插入失败"
#fi
# 综合案例：从csv文件读取内容，批量存入数据库
read -p "请输入文件名(.csv格式)：" csv
until [ -n "$csv" ]
do
read -p "文件名不能为空，请重新输入：" csv

until [ -e $csv ]
do
read -p "文件不存在，请重新输入：" csv
done

done

cat $csv > 1

#定义域分隔符->分割字符串
IFS=","
while read username sex address
do

MYSQL=$(which mysql)
# 插入数据
$MYSQL suhc -h 127.0.0.1 -u root << EOF
insert into user (username, sex, address) values ("$username", "$sex", "$address");
EOF
# 获取SQL状态 $?获取上个指定的执行状态 -eq是否等于 等于0代表上个指令执行成功
if [ $? -eq 0 ]
then
echo "插入成功"
else
echo "插入失败"
fi

done < $1


