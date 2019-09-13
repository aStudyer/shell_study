#!/bin/bash
# 内容一：管道 上个命令的输出 作为下个命令的输入
#cat day01.sh | while read str
#do
#    echo $str
#done

# 内容二：重定向输出
# 0：标准输入>对应键盘输入
# 1：标准输出>对应终端显示
# 2：标准错误
# 重定向-重定向错误-输入和输出-不同文件
# 重定向 错误信息重定向到error.sh 输出信息重定向到ls.sh
#ls -a abc.sh 2> error.sh 1> ls.sh

# 追加 错误信息追加到error.sh 输出信息追加到ls.sh
#ls -a abc.sh 2>> error.sh 1>> ls.sh

# 重定向-重定向错误-输入和输出-同一个文件
#ls -al day01.sh day100.sh &> common.sh

# 临时重定向 下面这句话被定义为错误信息
#echo "Hello World" >&2
#echo "你好"
# 执行脚本 1、./day04.sh > error.sh 2、./day04.sh 2> error.sh

# 永久重定向
# exec命令：批量输出
# 把exec后面输出的内容批量重定向到fileContent.sh
#exec 1> fileContent.sh
#echo "Hello World"
#echo "你好"

# 把exec后面输出的错误信息批量重定向到error.sh
#exec 2> error.sh
#echo "错误信息1" >&2
#echo "错误信息2" >&2

# 综合应用：把exec后面输出的错误信息批量重定向到error.sh 正确信息批量重定向到fileContent.sh
#exec 2> error.sh 1> fileContent.sh
#echo "错误信息1" >&2
#echo "错误信息2" >&2
#echo "输出内容1"
#echo "输出内容2"

# 内容三：重定向输入
# 从fileContent.sh文件中读取内容到当前文件
# 注意：一旦设置了输入重定向，read命令自动链接文件输入内容
#exec 0< fileContent.sh
# 循环遍历读取
#count=1
#while read line
#do
#    echo "当前行数：$count 读取内容：$line"
#    count=$[$count+1]
#done

# 内容四：创建自己的重定向
# 0、1、2是系统默认提供的，我们也可以定义自己的重定向
#exec 3> custom.sh
#echo "自定义重定向内容1" >&3
#echo "自定义重定向内容2" >&3
#echo "我不属于自定义重定向3的内容"
# 追加内容

# 内容五：恢复原始文件描述符
# exec命令：自定义文件描述符
# 把3重定向到1
#exec 3>&1
#exec 1> fileContent.sh
#
#echo "信息1"
#echo "信息2"
#
## 将1还原为3
#exec 1>&3
#echo "我会显示在fileContent.sh文件中吗？"

# 创建输入文件描述符
#exec 6<&0
#exec 0< fileContent.sh
# 循环遍历读取
#count=1
#while read line
#do
#    echo "当前行数：$count 读取内容：$line"
#    count=$[$count+1]
#done
# 恢复之前文件描述符
#exec 0<&6
#read -p "你是不是男人？" isMan
#case $isMan in
#    Y|y)
#        echo "男人"
#        ;;
#    N|n)
#        echo "女人"
#        ;;
#esac

# 创建读写文件描述符
exec 9<> fileContent.sh
# 注意：以下脚本把第二行内容替换了，因为文件读完第1行后，指针指向了第2行，所以第2行所有的内容被替换
read line <&9
echo "读取的内容为：$line"
# 写入内容
echo "哈哈哈" >&9

