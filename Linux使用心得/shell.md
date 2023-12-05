# 一、sed
1. 单引号 不需要转义
双引号 需要转义

2. 某一行插入
`sed -i "2i xx"`

3. 去除 ^M 
`sed -i 's/\r//g'`

4. 替换第1到2行
`sed -i "1,2s/xx/yy/"`

5.提取文件的1000-2000行
`sed -n '1000,2000p' filename.txt > extracted_lines.txt`
# 二、vi
1. 取消tab
`set et!`
`set ts=1`

2. 显示行号
`set nu`
  取消行号
`set nonu`

3. 删除某行到某行最后一个字符 `:7,61 s/$//`
每行的行首都添加一个字符串 `:%s/^/string`
每行的行尾都添加一个字符串`:%s/$/string`
% 代表针对被编辑文件的每一行进行后续操作
$ 代表一行的结尾处
^ 代表一行的开头处
删除含有某个字符的行： `:/string/d`
所有行 `:g/字符/d`

4. `sed "s:strings/string\([0-9]*\).txt:\1:"`
将 strings/stringX.txt替换成 X
5. 删除光标到行尾 
`:,$d`
6. 


# 三、基本数据处理
1. 计算平均值
`cat xx | awk '{ sum+=$1} END{print "Avergae= ", sum/NR}'`

2. 输出偶数列
`awk '{for(i=2;i<=NF;i+=2) printf "%s ",$i;printf "\n"}' file.txt`

#其他
1.amber格式
```
cat mix1.pdb |awk '{if($1=="HETATM"){printf "%6s%5d  %-4s%3s%6d%12.3f%8.3f%8.3f\n", $1,$2,$3,$4,$6,$7,$8,$9} else{print $0}}' > m.pdb
```
2. gromacs格式
```
cat d6_h.gro | awk '{printf "%8s%7s%5d%8.3f%8.3f%8.3f\n", $1,$2,$3,$4,$5,$6}' > d6.gro
```

3. 排序
`sort -n -k 1 -t " " all-dh.dat -o all-dh-2.dat`

4. 关于浮点数
加减：`c=$(echo "$i-$j" |bc)`
乘除：`c=$(echo "scale=2; $i/$j" |bc)` 2代表小数点后面几位小数
循环：`for file in $(seq 3.0 .2 3.8);do`

5. rename 批量重命名文件


6. 列转换成行 
`cat xxx | xargs`

7. 输出  
`2>&1 | tee`

8. `./test.sh 50`
`$0` 等于 `./test.sh`这个值
`$1`等于`50` 代表传入的第一个数

9. `grep -v string` 忽略这个字符串

10. 在终端循环
`for (( )) do XX;done`

11. 截取字符串 `substr($3,1,1)`
12. 终端 从光标到行尾删除：`ctrl+K`
    从光标到行首删除:`ctrl + w`
13.在文件末尾追加内容
echo prinf cat