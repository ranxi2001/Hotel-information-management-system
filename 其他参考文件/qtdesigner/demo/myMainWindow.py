# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'designerLSZaKN.ui'
##
## Created by: Qt User Interface Compiler version 5.15.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################



import pymysql
from PySide6.QtCore import *
from PySide6.QtGui import *
from PySide6.QtWidgets import *

from QtUser import User_Dialog
db=pymysql.connect(host="localhost",user="root",passwd="123456",db="test", charset="utf8")
cursor=db.cursor()



class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.resize(640, 480)
        self.action = QAction(MainWindow)
        self.action.setObjectName(u"action")
        self.action_2 = QAction(MainWindow)
        self.action_2.setObjectName(u"action_2")
        self.action_3 = QAction(MainWindow)
        self.action_3.setObjectName(u"action_3")
        self.action_4 = QAction(MainWindow)
        self.action_4.setObjectName(u"action_4")
        self.action_5 = QAction(MainWindow)
        self.action_5.setObjectName(u"action_5")
        self.centralwidget = QWidget(MainWindow)
        self.centralwidget.setObjectName(u"centralwidget")
        self.OKBtn = QPushButton(self.centralwidget)
        self.OKBtn.setObjectName(u"OKBtn")
        self.OKBtn.setGeometry(QRect(300, 400, 80, 22))
        self.lab1 = QLabel(self.centralwidget)
        self.lab1.setObjectName(u"lab1")
        self.lab1.setGeometry(QRect(30, 20, 65, 14))
        self.Edit1 = QLineEdit(self.centralwidget)
        self.Edit1.setObjectName(u"Edit1")
        self.Edit1.setGeometry(QRect(120, 20, 113, 22))
        self.cancelBtn = QPushButton(self.centralwidget)
        self.cancelBtn.setObjectName(u"cancelBtn")
        self.cancelBtn.setGeometry(QRect(400, 400, 80, 22))
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QMenuBar(MainWindow)
        self.menubar.setObjectName(u"menubar")
        self.menubar.setGeometry(QRect(0, 0, 513, 19))
        self.menu = QMenu(self.menubar)
        self.menu.setObjectName(u"menu")
        self.menu_2 = QMenu(self.menubar)
        self.menu_2.setObjectName(u"menu_2")

        self.tbw = QTableWidget(self.centralwidget)
        self.tbw.setObjectName(u"tbw")        
        self.tbw.setGeometry(QRect(20, 50, 600, 300))

        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QStatusBar(MainWindow)
        self.statusbar.setObjectName(u"statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.menubar.addAction(self.menu.menuAction())
        self.menubar.addAction(self.menu_2.menuAction())
        self.menu.addAction(self.action)
        #此处代码是关联菜单项和响应函数
        self.action.triggered.connect(self.user_search)
        
        self.menu.addAction(self.action_2)
        #此处代码是关联菜单项和响应函数
        self.action_2.triggered.connect(self.goods_search)
        self.action_5.triggered.connect(self.user_input)
        
        self.menu.addAction(self.action_3)
        self.menu_2.addAction(self.action_4)
        self.menu_2.addAction(self.action_5)
        #此处代码与按钮点击事件响应函数进行关联
        self.OKBtn.clicked.connect(self.OKBtn_click)
        self.cancelBtn.clicked.connect(self.cancelBtn_Clicked)
        self.Win=MainWindow        

        self.retranslateUi(MainWindow)

        QMetaObject.connectSlotsByName(MainWindow)
    # setupUi

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"MainWindow", None))
        self.action.setText(QCoreApplication.translate("MainWindow", u"\u7528\u6237\u4fe1\u606f\u67e5\u8be2", None))
        self.action_2.setText(QCoreApplication.translate("MainWindow", u"\u5546\u54c1\u4fe1\u606f\u67e5\u8be2", None))
        self.action_3.setText(QCoreApplication.translate("MainWindow", u"\u4f9b\u5e94\u5546\u4fe1\u606f\u67e5\u8be2", None))
        self.action_4.setText(QCoreApplication.translate("MainWindow", u"\u5546\u54c1\u4fe1\u606f\u5f55\u5165", None))
        self.action_5.setText(QCoreApplication.translate("MainWindow", u"用户信息录入", None))
        self.OKBtn.setText(QCoreApplication.translate("MainWindow", u"\u786e\u5b9a", None))
        self.lab1.setText(QCoreApplication.translate("MainWindow", u" ", None))
        self.cancelBtn.setText(QCoreApplication.translate("MainWindow", u"\u53d6\u6d88", None))
        self.menu.setTitle(QCoreApplication.translate("MainWindow", u"\u67e5\u8be2", None))
        self.menu_2.setTitle(QCoreApplication.translate("MainWindow", u"\u4fe1\u606f\u5f55\u5165", None))
        
    # retranslateUi
    def user_search(self):
        print("用户信息查询")
        self.lab1.setText("用户信息查询")
    def user_input(self):
        print("用户信息查询")
        self.UserWin=QMainWindow()
        self.userdlg=User_Dialog()
        self.userdlg.setupUi(self.UserWin)
        self.userdlg.cursor=cursor
        self.userdlg.db=db
        self.UserWin.show()
      
    def goods_search(self):
        print("商品信息查询")
        self.lab1.setText("商品信息查询")
    def OKBtn_click(self):
        sql = "SELECT * FROM student"
        print(sql)
        try:
        # 执行SQL语句
            cursor.execute(sql)
            db.commit()
            results = cursor.fetchall()
            i=0
            self.tbw.setColumnCount(5)
            self.tbw.setRowCount(len(results))
            for row in results:
                item =QTableWidgetItem(str(row[0]))
                self.tbw.setItem(i,0,item)
                item =QTableWidgetItem(str(row[1]))
                self.tbw.setItem(i,1,item)
                item =QTableWidgetItem(str(row[2]))
                self.tbw.setItem(i,2,item)
                item =QTableWidgetItem(str(row[3]))
                self.tbw.setItem(i,3,item)		
                item =QTableWidgetItem(str(row[4]))
                self.tbw.setItem(i,4,item)					
                i=i+1						
        except Exception as e:
        # 发生错误时回滚
            print("Error: unable to fecth data",e)        
    def cancelBtn_Clicked(self):
        self.Win.close()
# app=QApplication([])
# Form=QMainWindow()
# dlg=Ui_MainWindow()
# dlg.setupUi(Form)
# Form.show()
# app.exec()
