#!/bin/bash

# 内容一：echo命令
# 1、显示普通字符串
#echo "iPhoneX 标配 8388"

# 2、显示转义字符
#echo "  \" iPhoneX 顶配 9688 \"  "

# 3、显示变量
#iphone="iPhoneX"
#echo "${iphone}9688"

# 4、显示换行
# 错误写法
#echo "iPhoneX \n hello未来"
# 正确写法（-e：表示开启转义功能）
#echo -e "iPhoneX \n hello未来"

# 5、不换行
# 换行
#echo "iPhoneX hello未来"
#echo "科技"
# 不换行
#echo -e "iPhoneX hello未来 \c"
#echo "科技"

# 6、显示一个执行命令
# 要求：输出当前时间
#echo `date`

#7、退出命令
# 语法：exit 状态
# 写法一
#iphone="你买的翻盖iPhoneX多少钱？"
#echo ${iphone}
#exit
#echo "你完蛋了，买了假货"

# 写法二
#iphone="你买的翻盖iPhoneX多少钱？"
#echo ${iphone}
#exit 0
#echo "你完蛋了，买了假货"

# 内容二：数组
# 1、语法
# 数组名=(值1 值2 值3…)
# 2、初始化数组
# 方式一
#name=("橘子" "香蕉" "苹果" "葡萄")
# 输出
#echo $name

# 方式二
#name=()
#name[0]="橘子"
#name[1]="香蕉"
#name[2]="苹果"
#name[3]="葡萄"
#echo ${name[0]} ${name[1]}

# 3、读取数组
# 语法结构：${数组名[下标]}
#name=("橘子" "香蕉" "苹果" "葡萄")
# 输出一个元素
#echo ${name[0]}
# 输出所有 -> "@" 和 "*" 表示输出所有的数据
# 总结："@" 和 "*" 区别
# "@"->输出结果:"橘子" "香蕉" "苹果" "葡萄"
# "*"->输出结果:"橘子 香蕉 苹果 葡萄"
#echo ${name[@]}

# 4、数组长度
# 方式一：获取数组元素个数
# 语法：${#数组名[@]}
# 代码：
#name=("橘子" "香蕉" "苹果" "葡萄")
#echo ${#name[@]}
#结果：4

# 方式二：获取数组元素个数
# 语法：${#数组名[*]}
# 代码：
#name=("橘子" "香蕉" "苹果" "葡萄")
#echo ${#name[*]}
#结果：4

# 方式三：获取单个元素->字符长度
# 语法：${#数组名[下标]}
# 代码：
#name=("橘子" "火龙果" "苹果" "葡萄")
#echo ${#name[1]}
#结果：3

# 内容三：传递参数
# 1、语法定义
# ./文件名称.sh 参数1 参数2 参数3...
# 2、案例
# 脚本内容如下：
# ${0}->表示文件名称  也可以直接写为$0
# $1->表示参数1      也可以直接写为$1
# $2->表示参数2      也可以直接写为$2
#echo $0 $1 $2
# 执行脚本代码：./day02.sh "逗你玩" "饿到爆"

# 3、特殊字符
# 3.1 $#：获得脚本输入参数个数
# 脚本内容如下：
#echo ${#}
# 执行脚本代码：./day02.sh "逗你玩" "饿到爆"
# 执行脚本结果：2

# 3.2 "$*"和"$@"：显示整个脚本输入参数列表
# 脚本内容如下：
#echo ${*}
# 执行脚本代码：./day02.sh "逗你玩" "饿到爆"
# 执行脚本结果："逗你玩 饿到爆"

# 内容四：基本运算符
# 1、算数运算符？
# 1.1 "+"运算
# 注意："expr"规定命令
#a=10
#b=20
#c=`expr $a + $b`
#echo "c的值：$c"

# 1.2 "-"运算
# 注意："expr"规定命令
#a=30
#b=20
#c=`expr $a - $b`
#echo "c的值：$c"

# 1.3 "*"运算
# 注意："expr"规定命令
# 注意：乘法运算记得加一个"\*"转义字符
#a=10
#b=20
#c=`expr $a \* $b`
#echo "c的值：$c"

# 1.4 "/"运算
# 注意："expr"规定命令
#a=100
#b=10
#c=`expr $a / $b`
#echo "c的值：$c"

# 1.5 "%"运算
# 注意："expr"规定命令
#a=111
#b=10
#c=`expr $a % $b`
#echo "c的值：$c"

# 1.6 "="运算
# 注意："expr"规定命令
#a=10
#b=$a
#echo "b的值：$b"

# 1.7 "=="运算
# 注意："expr"规定命令
#a=100
#b=100
#if [ $a == $b ]
#then
#echo "a等于b"
#else
#echo "a不等于b"
#fi

# 2、关系运算符
# 2.1 "-eq"：检测两个数是否相等，当等返回true
#a=100
#b=100
#if [ $a -eq $b ]
#then
#echo "a等于b"
#else
#echo "a不等于b"
#fi

# 2.2 "-ne"：检测两个数是否相等，不相等返回true
#a=100
#b=200
#if [ $a -ne $b ]
#then
#echo "a不等于b"
#else
#echo "a等于b"
#fi

# 2.3 "-gt"：检测左边数是否大于右边数，如果是，返回true
#a=100
#b=200
#if [ $a -gt $b ]
#then
#echo "a大于b"
#else
#echo "a小于b"
#fi

# 2.4 "-lt"：检测左边数是否小于右边数，如果是，返回true
#a=100
#b=200
#if [ $a -lt $b ]
#then
#echo "a小于b"
#else
#echo "a大于b"
#fi

# 2.5 "-ge"：检测左边数是否(大于+等于)右边数，如果是，返回true
#a=200
#b=200
#if [ $a -ge $b ]
#then
#echo "a大于等于b"
#else
#echo "a小于b"
#fi

# 2.6 "-le"：检测左边数是否(小于+等于)右边数，如果是，返回true
#a=100
#b=200
#if [ $a -le $b ]
#then
#echo "a小于等于b"
#else
#echo "a大于b"
#fi

# 3、布尔值运算符
# 3.1 "!"：非运算，表达式为true，返回true，否则返回false
#a=200
#b=200
#if [ $a != $b ]
#then
#echo "a不等于b"
#else
#echo "a等于b"
#fi

# 3.2 "-o"：或运算，有一个表达式为true，则返回true
#a=100
#b=200
#if [ $a -lt 200 -o $b -gt 200 ]
#then
#echo "成立"
#else
#echo "不成立"
#fi

# 3.3 "-a"：与运算，两个表达式为true，则返回true
#a=100
#b=200
#if [ $a -lt 200 -a $b -gt 200 ]
#then
#echo "成立"
#else
#echo "不成立"
#fi

# 4、逻辑运算符
# 4.1 "&&"：逻辑且->and
#a=100
#b=200
#if [ $a -lt 200 ] && [ $b -gt 200 ]
#then
#echo "成立"
#else
#echo "不成立"
#fi

# 4.2 "||":逻辑 OR
#a=100
#b=200
#if [ $a -lt 200 ] || [ $b -gt 200 ]
#then
#echo "成立"
#else
#echo "不成立"
#fi

# 5、字符串运算
# 5.1 "="：检测两个字符串是否相等，如果相等返回true
#a="JAR"
#b="JAR"
#if [ $a = $b ]
#then
#echo "相等"
#else
#echo "不相等"
#fi

# 5.2 "!="：检测两个字符串是否相等，如果不相等返回true
#a="JAR"
#b="逗你玩"
#if [ $a != $b ]
#then
#echo "不相等"
#else
#echo "相等"
#fi

# 5.3 "-z"：检测字符串长度是否为0，如果是返回true
#a=""
#if [ -z $a ]
#then
#echo "a为空,不存在"
#else
#echo "a存在值"
#fi

# 5.4 "-n"：检测字符串长度是否为0，如果不是0，返回true
#a="hello"
#if [ -n "$a" ]
#then
#echo "a存在"
#else
#echo "a不存在值"
#fi

# 5.5 "字符串"：检测字符串是否为空，不为空返回true
#a=""
#if [ $a ]
#then
#echo "a不为空"
#else
#echo "a为空"
#fi

# 6、文件测试运算符
# 6.1 "-d file"：检测文件是不是一个目录，如果是，那么返回true
#file="/Users"
#if [ -d $file ]
#then
#echo "是一个目录"
#else
#echo "不是一个目录"
#fi

# 6.2 "-r file"：检测文件是否可读，如果是，那么返回true
#file="/Users"
#if [ -r $file ]
#then
#echo "可读"
#else
#echo "不可读"
#fi

# 6.3 "-w file"：检测文件是否可写，如果是，那么返回true
#file="/Users"
#if [ -w $file ]
#then
#echo "可写"
#else
#echo "不可写"
#fi

# 6.4 "-x file"：检测文件是否是可执行文件，如果是，那么返回true
#file="/Users"
#if [ -x $file ]
#then
#echo "可执行"
#else
#echo "不可执行"
#fi

# 6.5 "-f file"：检测文件是否是一个普通文件（既不是目录，也不是设备文件），如果是，那么返回true
#file="/Users"
#if [ -f $file ]
#then
#echo "文件为普通文件"
#else
#echo "文件为特殊文件"
#fi

# 6.6 "-s file"：检测文件是否为空（文件有内容），如果是，那么返回true
#file="/Users"
#if [ -s $file ]
#then
#echo "文件有内容"
#else
#echo "文件没有内容"
#fi

# 6.7 "-e file"：检测文件是否存在（包含了：目录和文件），如果是，那么返回true
#file="/Users"
#if [ -e $file ]
#then
#echo "存在"
#else
#echo "不存在"
#fi

# 内容五：流程控制
# 1、"for"循环语句
# 语法结构
# for 变量名 in item1 item2 item3 …
# do
# 代码
# done
# 代码案例一:读取简单的值
#for name in "Java" "iOS" "Ruby" "Python"
#do
#    echo ${name}
#done

# 代码案例二:读取列表复杂值(特殊字符)
# 错误代码
#for name in "I don`t konw"
#do
#    echo ${name}
#done
# 正确代码
#for name in "I don\`t konw"
#do
#echo ${name}
#done

# 代码案例三:从变量读取列表
#val="I don\`t konw"
#for name in ${val}
#do
#    echo ${name}
#done

# 代码案例四:读取目录->通配符
#file="/Users/*"
#for name in ${file}
#do
#    echo $name
#done

# 代码案例五：嵌套循环(类似于C语言写法)
#for ((a = 1; a < 5; a++))
#do
#    echo ${a}
#done

#for ((a = 1; a < 5; a++))
#do
#    echo ${a}
#    for((b = 1; b < 5; b++))
#    do
#        echo "${a}-${b}"
#    done
#done

# 2、"while"循环
# 语法结构
# while(条件)
# do
#    代码
# done
# 代码案例一:基本循环
#a=1
#while(($a<10))
#do
#    echo ${a}
#    a=`expr $a + 1`
#done

# 代码案例二:无限循环
#while :
#do
#echo "Hello"
#done
#while true
#do
#echo "Hello"
#done
#for((;;))
#do
#    echo "Hello"
#done

# 3、"case"语句
# 语法结构
# case 值 in
# 模式1)
# 代码
# ;;
# 模式2)
# 代码
# ;;
# 模式3)
# 代码
# ;;
# sac
# 代码案例一
#number=2
#case $number in
#1)
#    echo "等于1"
#;;
#2)
#    echo "等于2"
#;;
#3)
#    echo "等于3"
#;;
#esac

# 4、until循环 和 while循环相反 为false进入
# 语法结构
# until 条件
# do
# 逻辑代码
# done
# 脚本代码
#i=1
#until (($i == 1))
#do
#echo "i小于等于1"
#done

# 5、跳出循环->break
# 5.1 跳出单个循环
#for ((i = 0; i < 10; i++))
#do
#    echo "当前i的值：${i}"
#    if [ $i -eq 5 ]
#    then
#        echo "退出循环"
#        break
#    fi
#done

# 5.2 跳出内部循环
#for ((i = 0; i < 5; i++))
#do
#    echo "外层循环i值：${i}"
#    for ((j = 0; j < 5; j++))
#    do
#        echo "内层循环j值：${j}"
#        if [ ${j} -eq 2 ]
#        then
#            echo "退出内层循环，执行下一个操作"
#            break
#        fi
#    done
#done

# 5.3 跳出外部循环
# break 层数（默认情况下 层数=1 退出一层循环 层数=2 退出2层循环）
#for ((i = 0; i < 5; i++))
#do
#    echo "外层循环i值：${i}"
#    for ((j = 0; j < 5; j++))
#    do
#        echo "内层循环j值：${j}"
#        if [ ${j} -eq 2 ]
#        then
#            echo "退出内层循环，执行下一个操作"
#            break 2
#        fi
#    done
#done

# 6、跳出循环->continue
#for ((i = 0; i < 5; i++))
#do
#    if [ ${i} -eq 2 ]
#    then
#        echo "下一个"
#        continue
#    else
#        echo "外层循环i值：${i}"
#    fi
#done
