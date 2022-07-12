# Hotel-information-management-system
数据库课程设计——酒店信息管理系统，一人四天的工作量，使用了PyQt5、Python3.9与MySQ8.0.29

## 功能设计

目前设计了4个功能【客房管理、员工管理、报表管理、修改密码】，是一个人做课设的正常工作量

## 运行方法

1、首先配置好MySQL（需要安装与python的连接器）

[MySQL的详细安装教程 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/188416607)

[pycharm连接MySQL数据库 - 晴天看恒星 - 博客园 (cnblogs.com)](https://www.cnblogs.com/korol7/p/12836290.html)

到第18步就够了，不用配置环境变量

2、安装好PyQt5

[(17条消息) Python+PyQt5+QtDesigner+PyUic+PyRcc（最全安装教程）_sever默默的博客-CSDN博客_pyrcc](https://blog.csdn.net/baidu_35145586/article/details/108110236)

[PyCharm安装PyQt5及其工具（Qt Designer、PyUIC、PyRcc）详细教程 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/469526603)

[ PyQt入门教程 Qt Designer工具的使用 - 锅边糊 - 博客园 (cnblogs.com)](https://www.cnblogs.com/linyfeng/p/11223707.html)

3、在DBMS（如navicat）或MySQL中导入hotelManagement.sql，即可生成需要用的所有表，表内数据可自行修改，但是要注意参照完整性约束。

4、main.py中dbConfig这个变量中修改有关数据库配置（账号密码等）

5、将文档内/pictures文件夹移动至D:，这是因为前端Qt StyleSheet中许多图片采用的绝对地址--D:/pictures/xxx

6、运行Main.py即可

## 依赖库

* pyqt5：可视化展示
* pymysql：python3与mysql连接
* matplotlib：用于生成报表
* xlwt：用于将数据写入excel
  以上使用pip安装即可

## 截图

功能结构图：![image](https://github.com/ranxi169/Hotel-information-management-system/blob/main/references/Functional_structure_diagram.png)

E-R图：![image](https://github.com/ranxi169/Hotel-information-management-system/blob/main/references/E-R_diagram.jpg)
