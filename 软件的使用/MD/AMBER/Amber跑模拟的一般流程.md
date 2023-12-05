# 1.建模
执行tleap.in文件 tleap -f tleap.in
# 1.1 非标准残基
非标准残基|AMBER残基名字
:--|:--:
质子化/不带电Asp|ASH
质子化/不带电Glu|GLH
脱质子/不带电Lys|LYN
在ε位置上质子化His(远离侧链的N)|HIE
在δ位置上质子化His(靠近侧链的N)|HID
His两个位置都质子化|HIP
脱质子或者和一个金属相连接|CYM
Cys涉及到双硫桥接|CYX
## 1.1.1 质子化
质子化软件：
1.H++:
2.Propka:
残基pKa小于7，脱质子
残基pKa大于7，质子化

## 1.1.2 Cys与金属相连接
## 1.2 含有配体的复合物建模
### 1.2.1 非键相互作用
生成RESP电荷的脚本：
```
#p b3lyp/ opt em=gd3bj IOp(6/33=2,6/42=6) pop=mk scrf(smd,solvent=c6h5cl)
```
其中，
1. `IOp(6/33=2)`:让Gaussian把拟合点的位置和静电势数值打印到输出文件里的选项
`IOp(6/41=N)`：拟合ESP电荷时每个原子用N个同中心的点层为，默认N=4（一般不用写这个关键词）。
`IOp(6/42=N)`: 拟合ESP电荷时每单位面积的点为N个，默认N=1。17时每个原子大概用2500个点，对于大分子可以稍微降低这个值以减少计算量，一般设为6
2. 溶剂为氯仿是为了模拟酶环境，如果是蛋白质环境的话在尾部写`eps=4`

利用antechamber生成resp电荷
```
antechamber -i YJE.log -fi gout -o YJE.mol2 -fo mol2 -c resp -nc -1 -rf YJE -rn YJE -a YJE_H.pdb -fa pdb -ao name -pf Y
```

### 1.2.2 共价连接
## 1.3 金属配位的建模
### 1.3.1 配位键用非键相互作用来表示
### 1.3.2 配位键用成键相互作用来表示
#### 1.3.2.1 锌离子成键模型（ZAFF）
#### 1.3.2.2 其他金属离子成键模型
TIPS： Seminario/ChgModB方法最佳（默认）

##### 报错：

##### 1.出现这种错误：
```
Traceback (most recent call last):
  File "/share/apps/amber/20/bin/MCPB.py", line 581, in <module>
    raise pymsmtError('%s is required in naa_mol2files but not '
pymsmt.exp.pymsmtError: HOH is required in naa_mol2files but not provided.
```
文件名字和pdb中的残基名字不匹配
##### 2.金属离子的电荷是负的，或者其他原子的电荷分布出现明显错误
可能是与金属配位的残基命名不对，导致电荷分布有问题，比如CYS未改成CYM
# 2. 跑模拟
## 2.1 最小化
## 2.2 NVT系综（加热）
## 2.3 NPT系综

## Tips:
### 1）加限制的方法
### 2）QM/MM方法