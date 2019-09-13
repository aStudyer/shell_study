# 定义文件声明 告诉系统这个脚本需要什么样的解释器执行
#!/bin/bash
# 1、第一个Shell程序
#echo "Hello world!"

# 2、注释
# 这里是注释内容

# 3、变量
# 3.1、书写格式
# 注意：变量名和等号不能够有空格
# 正确写法
#name="tom"
# 错误写法
#name = "tom"
# 注意：变量名首字母必需是字母+下划线也可以（a-z、A-Z）
# 正确写法
#age=100
#echo $age
# 正确写法
#_age=100
#echo $_age
# 正确写法
#__age=200
#echo $__age
# 注意：不允许使用标点符号
# 错误写法
#na,me="tom"

# 3.2、只读变量
#name="hello"
#readonly name
#name="world"
#echo "执行了"

# 3.3、删除变量
#name="tom"
# 输出变量值
#echo $name
# 删除变量
#unset name
# 访问
#echo $name
#echo "执行了"

# 3.4、位置变量
#name="tom"
#echo "name：${name}"

# 3.5、特殊变量
# $0->当前脚本的文件名
#filename=${0}
#echo "文件名称: ${filename}"

# $n->传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2
#name=$1
#age=$2
#sex=$3
#echo "姓名：${name} 年龄：${age} 性别：${sex}"

# $#->传递给脚本或函数的参数个数
#echo "Total Number of Parameters : $#"

# $*->传递给脚本或函数的所有参数
#echo "Quoted Values: $*"

# $@->传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同
#echo "Quoted Values: $@"

# $?->上个命令的退出状态，或函数的返回值
#name = "tom"
#echo $?

# $$->当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID
#echo $$

# $* 和 $@ 的区别
# $* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
# 但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数

# 4、字符串
# 4.1、字符串->单引号
#name='Andy'
#echo ${name}

# 4.2、字符串->双引号
#name="Andy"
#echo ${name}

# 4.3、字符串->拼接
# 方式一
#name="Tom"
#age=18
#sex="男"
#info="姓名：${name} 年龄：${age} 性别：${sex}"
#echo ${info}

# 方式二
#name="Tom"
#age=18
#sex="男"
#info="姓名："${name}" 年龄："${age}" 性别："${sex}""
#echo ${info}

# 4.4、字符串->获取字符串长度
#name="Tom"
#echo ${#name}

# 4.5、字符串->截取
# 语法：${变量名:开始位置:截取长度}
# 案例一：从字符串第3个开始截取，截取3个
#name="I have a Dream"
#result=${name:2:3}
#echo ${result}

# 案例二：从字符串第5个开始截取，到最后一个结束
# 方式一
#name="I have a Dream"
#length=${#name}
# 正确
#result=${name:5:length-1}
# 正确
#result=${name:5:${#name}-1}
# 正确
#result=${name:5:${#name}}
#echo ${result}

# 方式二
#name="I have a Dream"
#result=${name:5}
#echo ${result}

# 4.6、字符串->删除
# 语法一：${变量名#删除字符串 正则表达式}
# 从左边开始检查 从左边删除
# 案例一 结果：匹配不到
#name="I have a Dream"
#result=${name#Dream}
#echo ${result}

# 案例二
#name="I have a Dream"
#result=${name#I}
#echo ${result}


# 案例三：查找指定字符第一个，并且删除前面所有的字符（包含自己）
#name="I have a Dream"
#result=${name#*D}
#echo ${result}

# 案例四：指定删除范围(第一个开始删除，删除到哪里)
#name="I have a Dream"
#result=${name#I*D}
#echo ${result}

# 语法二：${变量名##删除字符串 正则表达式}
# 从右边开始检查 从左边删除
# 作用：从字符串结尾（右边）开始匹配要删除字符串
#name="I have a Dream"
#result=${name##*a}
#echo ${result}
# 总结：语法一和语法二，都是从左边删除到右边，查找方向不一样

# 语法三：${变量名%删除字符串 正则表达式}
# 从字符串结尾开始匹配，删除匹配的字符串
# 案例一：查找第一个字符
# 代码一
# 查找不到
#name="I have a Dream"
#result=${name%a}
#echo ${result}
# 代码二：
# 查到了
#name="I have a Dream"
#result=${name%eam}
#echo ${result}

# 案例二：查找指定字符第一个，并且删除后面所有字符（包含自己）
#name="I have a Dream"
#result=${name%h*}
#echo ${result}

# 语法四：${变量名%%删除字符串 正则表达式}
# 案例一：查找指定字符最后一个，并且删除前面所有的字符（包含自己）
#name="I have a Dream"
#result=${name%%a*}
#echo ${result}

#总结：
#从左边删除到右边
#->表示查询方向从左到右
##->表示查询方向从右到左
#从右边删除到左边
#%->表示查询方向从右到左
#%%->表示查询方向从左到右
















