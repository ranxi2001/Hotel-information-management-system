# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'designerLSZaKN.ui'
##
## Created by: Qt User Interface Compiler version 5.15.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################




import pymysql
import sys

from PySide6.QtCore import *
from PySide6.QtGui import *
from PySide6.QtWidgets import *

class User_Dialog(object):
    def setupUi(self, Dialog):
        if not Dialog.objectName():
            Dialog.setObjectName(u"Dialog")
        Dialog.resize(340, 234)
        self.insertBtn = QPushButton(Dialog)
        self.insertBtn.setObjectName(u"insertBtn")
        self.insertBtn.setGeometry(QRect(40, 180, 80, 22))
        self.pushButton_2 = QPushButton(Dialog)
        self.pushButton_2.setObjectName(u"pushButton_2")
        self.pushButton_2.setGeometry(QRect(170, 180, 80, 22))
        self.label = QLabel(Dialog)
        self.label.setObjectName(u"label")
        self.label.setGeometry(QRect(40, 30, 65, 14))
        self.label_2 = QLabel(Dialog)
        self.label_2.setObjectName(u"label_2")
        self.label_2.setGeometry(QRect(40, 60, 65, 14))
        self.label_3 = QLabel(Dialog)
        self.label_3.setObjectName(u"label_3")
        self.label_3.setGeometry(QRect(30, 100, 65, 14))
        self.txtSNO = QLineEdit(Dialog)
        self.txtSNO.setObjectName(u"txtSNO")
        self.txtSNO.setGeometry(QRect(130, 30, 113, 22))
        self.txtSNAME = QLineEdit(Dialog)
        self.txtSNAME.setObjectName(u"txtSNAME")
        self.txtSNAME.setGeometry(QRect(130, 60, 113, 22))
        self.txtAGE = QLineEdit(Dialog)
        self.txtAGE.setObjectName(u"txtAGE")
        self.txtAGE.setGeometry(QRect(130, 90, 113, 22))

        self.retranslateUi(Dialog)
        self.insertBtn.clicked.connect(self.insertBtn_Clicked)
        self.pushButton_2.clicked.connect(self.exit_Clicked)

        QMetaObject.connectSlotsByName(Dialog)
        self.cursor=None
        self.db=None
        self.dlg=Dialog
    # setupUi

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QCoreApplication.translate("Dialog", u"Dialog", None))
        self.insertBtn.setText(QCoreApplication.translate("Dialog", u"\u6dfb\u52a0", None))
        self.pushButton_2.setText(QCoreApplication.translate("Dialog", u"\u53d6\u6d88", None))
        self.label.setText(QCoreApplication.translate("Dialog", u"\u5b66\u53f7\uff1a", None))
        self.label_2.setText(QCoreApplication.translate("Dialog", u"\u59d3\u540d\uff1a", None))
        self.label_3.setText(QCoreApplication.translate("Dialog", u"\u5e74\u9f84\uff1a", None))
    # retranslateUi

    def insertBtn_Clicked(self):
        m_sno=self.txtSNO.text()
        m_sname=self.txtSNAME.text()
        m_age=self.txtAGE.text()
        sql = "insert into student(sno,sname,sage) values('"+m_sno+"','"+m_sname+"',"+m_age+")"
        print(sql)
        try:
        # 执行SQL语句
            self.cursor.execute(sql)
            self.db.commit()	
        except Exception as e:
        # 发生错误时回滚
            print("Error: unable to fecth data",e)
        
    def exit_Clicked(self):
        self.dlg.close()