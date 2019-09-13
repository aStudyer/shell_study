#!/bin/bash
# 内容一：文件包含
# 包含文件A和文件B
# 方式一
#./fileA.sh
#./fileB.sh
#echo "我是文件day03.sh"
# 方式二
#source fileA.sh
#source fileB.sh
#echo "我是文件day03.sh"

# 内容二：cat命令
# 作用一：查看文件内容
# 作用二：连接文件
# 作用三：创建一个文件或者多个文件
# 作用四：重定向输出到终端
# 作用五：重定向到文件
# 语法：cat [选项] [文件]
# 案例演示
# 案例一：查看文件内容
#cat fileA.sh
# 案例二：
# -n选项：可以显示文件内容和行号
#cat -n fileA.sh
# 案例三：
# -b选项：和"-n"类似功能，但是只标记非空白行行号
#cat -b fileA.sh
# 案例四：
# -e选项：在每一行内容最后加入了一个"$"符号，在需要将多行内容转换为一行内容的时候，非常有用
#cat -e fileA.sh
# 案例五：cat
# 接收标准输入，同时还会输出标准输出（敲回车键即可）
# 退出：control + c

# 内容三：获取用户输入->read命令
# 1、接收一个输入内容
# 写法一
#echo "请输入你的名字："
#read name
#echo "您的名字是：${name}"

# 写法二
#read -p "请输入你的名字：" name
#echo "您的名字是：${name}"

# 2、超时->输入时候，你过了多少秒没有输入，那么过期
#if read -t 6 -p "请输入你的名字：" name
#then
#    echo "您的名字是：${name}"
#else
#    echo
#    echo "超时"
#fi

# 3、隐藏输入的内容->"-s"->类似于输入密码
#read -s -p "请输入您密码：" pwd
#echo
#echo "您的密码是：${pwd}"

# 4、从文件里面读取内容->通过cat命令读取文件内容，然后通过while循环一行行读取
# -n 显示行号
#cat -n day03.sh | while read str
#do
#    echo "内容：${str}"
#done

# 内容四：printf命令使用
# 1、printf命令和echo命令区别？
# 区别一
# printf不会换行
# echo自动换行

# 2、printf语法结构
# printf format-string 参数列表
# 3、printf案例
# 案例一
# printf "%-10s %-8s %-6s \n" 姓名 性别 体重kg
# 打印输出内容->对齐
#printf "%-10s %-8s %-6s \n" Tom 男 64kg
#printf "%-10s %-8s %-6s \n" Lucy 女 65kg
#printf "%-10s %-8s %-6s \n" David 男 100kg

# 注意一："%-10s"指的是一个宽度为10个字符，"-"表示左对齐
# 假设：%-4s 长度："AndyAndy"
# s：表示字符串（字符）
# 注意二："%-4.2f"指的是一个宽度为4，小数点2位，"f"表示小数

#案例二
# 3.1、printf format-string为双引号
#printf "%d %s \n" 1 "Dream"

# 3.2、printf format-string为单引号
#printf '%d %s \n' 1 "Dream"

# 3.3 printf format-string没有号
#错误写法
#printf %d %s 1 "Dream"
#正确写法
#printf %s Dream

# 4、printf转义字符
#printf " \"<%s>\" " "Dream"

# 内容五：函数
# 1、语法结构
# [function] 方法名称(){
# 逻辑代码
# }
# 2、案例分析
# 定义方法
#function testFunc(){
#    echo "Hello world"
#    echo "第一个参数: $0"
#    echo "第二个参数: $1"
#    echo "第三个参数: $2"
#    echo "第四个参数: $3"
#}
# 调用方法
#echo "调用前"
#testFunc $1 $2 "枸杞"
#echo "调用后"
