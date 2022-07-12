# -*- coding: utf-8 -*-

################################################################################
## pip install MySQL

################################################################################

import pymysql
from PySide6.QtCore import *
from PySide6.QtGui import *
from PySide6.QtWidgets import *


#把主窗口引入
from myMainWindow import Ui_MainWindow


db=pymysql.connect(host="localhost",user="root",passwd="123456",db="test", charset="utf8")
cursor=db.cursor()


class Ui_Dialog(object):
    def setupUi(self, Dialog):
        if not Dialog.objectName():
            Dialog.setObjectName(u"Dialog")
        Dialog.resize(340, 234)
        self.loginBtn = QPushButton(Dialog)
        self.loginBtn.setObjectName(u"Login")
        self.loginBtn.setGeometry(QRect(40, 180, 80, 22))
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
        self.txtPASS = QLineEdit(Dialog)
        self.txtPASS.setObjectName(u"txtPASS")
        self.txtPASS.setGeometry(QRect(130, 60, 113, 22))


        self.retranslateUi(Dialog)
        self.loginBtn.clicked.connect(self.loginBtn_Clicked)
        self.pushButton_2.clicked.connect(self.exit_Clicked)
        self.logindlg=Dialog

        QMetaObject.connectSlotsByName(Dialog)
    # setupUi

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QCoreApplication.translate("Dialog", u"Dialog", None))
        self.loginBtn.setText(QCoreApplication.translate("Dialog", u"登录", None))
        self.pushButton_2.setText(QCoreApplication.translate("Dialog", u"\u53d6\u6d88", None))
        self.label.setText(QCoreApplication.translate("Dialog", u"\u5b66\u53f7\uff1a", None))
        self.label_2.setText(QCoreApplication.translate("Dialog", u"密码：", None))
    # retranslateUi

    def loginBtn_Clicked(self):
        self.MainWin=QMainWindow()
        self.dlg2=Ui_MainWindow()
        self.dlg2.setupUi(self.MainWin)
        self.MainWin.show()
        self.logindlg.setVisible(False)
    def exit_Clicked(self):
        self.logindlg.close()



app=QApplication([])
Form=QWidget()
dlg=Ui_Dialog()
dlg.setupUi(Form)
Form.show()


app.exec()
