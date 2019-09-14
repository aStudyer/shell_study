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
#exec 9<> fileContent.sh
# 注意：以下脚本把第二行内容替换了，因为文件读完第1行后，指针指向了第2行，所以第2行所有的内容被替换
#read line <&9
#echo "读取的内容为：$line"
# 写入内容
#echo "哈哈哈" >&9

# 关闭文件描述符
#exec 3> fileContent.sh
#echo "写入的内容" >&3
## 关闭文件描述符
#exec 3>&-
## 再次写入
#echo "再次写入的内容" >&3

# 阻止命令输出
# 案例一：阻止输出
#ls -al > /dev/null
# 案例二：清空文件
# 查看内容
#cat fileContent.sh
# 清空内容
#cat /dev/null > fileContent.sh

# 内容六：创建临时文件
# 案例一：保证当前目录文件唯一
# 动态生成文件后缀名
#mktemp temp.XXXXXX
# 指定文件名称后缀名
#mktemp temp.sh

# 案例二：临时文件实际使用
# 创建临时文件
#tempfile=$(mktemp testfile.XXXXXX)
## 重定向临时文件
#exec 3> $tempfile
## 打印文件名称
#echo "文件名称：$tempfile"
## 输出文件内容
#echo "内容1" >&3
#echo "内容2" >&3
#echo "内容3" >&3
##关闭文件
#exec 3>&-
## 打印文件内容
#cat $tempfile
## 删除文件
#rm -f $tempfile 2> /dev/null

# 在/temp目录下创建临时文件
# 案例一："-t"选项使用 在系统提供临时目录创建testfile文件
#mktemp -t testfile

# 案例二：在Shell脚本中应用临时目录
# 创建临时文件（系统临时目录下）
#tempfile=$(mktemp -t testfile)
## 写入内容
#echo "内容1" > $tempfile
## 追加内容
#echo "追加内容" >> $tempfile
## 打印文件路径
#echo "文件名称：$tempfile"
## 将文件内容输出到控制台
#cat $tempfile
## 删除文件
#rm -f $tempfile

# 创建临时目录
# "-d"创建目录
# 脚本代码
# 当前目录下创建临时目录
#tempfile=$(mktemp -d testfile)
## 进入临时目录
#cd $tempfile
## 在临时目录下创建临时文件
#tempfile1=$(mktemp testfile.XXXXXX)
#tempfile2=$(mktemp testfile.XXXXXX)
## 自定义文件描述符->重定向输出
#exec 7> $tempfile1
#exec 8> $tempfile2
## 打印临时目录路径
#echo "临时目录路径：$tempfile"
## 向临时文件写入内容
#echo "7777777777" >&7
#echo "8888888888" >&8
#cat $tempfile1
#cat $tempfile2
## 删除文件
#rm -rf ./$tempfile

# 内容七：记录消息
# 作用：将输出同时发送显示器和日志文件，这个时候你可以采用重定向两次，才可以实现，现在我才用tee命令一步实现（简化版）
# 案例一：重定向->输出->覆盖
#date | tee fileContent.sh

# 案例二：重定向->输出->追加->"-a"
#date | tee -a fileContent.sh

# 案例三：应用到脚本中
# 定义文件名称
#tempfile="testfile"
#echo "我要输出到控制台和文件" | tee $tempfile
#echo "我要追加内容" | tee -a $tempfile

# 内容八：数据操作->导出SQL文件
# 场景：别人给你一个exel表格
# 注意：导出.csv格式
# 需求：将.csv文件转成.sql文件
# 脚本实现
# 定义数据库文件(.sql)文件
#outfile='test.sql'
# 定义域分隔符->分割字符串
#IFS=','
#while read name age sex
#do
#cat >> $outfile << EOF #EOF不是关键字 可以随便写 推荐些EOF
#insert into t_test (name, age, sex) VALUES ('$name', '$age', '$sex');
#EOF
#done < $1
# 执行脚本 ./day04.sh test.csv
# 注意：原始数据空出一行

#分析含义
#3个重定向操作
#第一个：输入重定向
#done < ${1}
#${1}恰好是一个文件
#read通过循环一行行读取内容
#同时read非常智能还会通过IFS进行字符串分割，分割之后会自动给参数赋值
#第二个：输出重定向
cat >> temp.sh
#以上语法：等待输入内容，敲回车，然后输出到指定的重定向文件
#第三个：输入重定向-">>"->追加
#(cat >> test.sql ) << sql语句
