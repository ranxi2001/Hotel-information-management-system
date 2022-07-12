# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'myui.ui'
##
## Created by: Qt User Interface Compiler version 6.2.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QDialog, QLabel, QLineEdit,
    QPushButton, QSizePolicy, QWidget)

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        if not Dialog.objectName():
            Dialog.setObjectName(u"Dialog")
        Dialog.resize(400, 232)
        self.txtName = QLineEdit(Dialog)
        self.txtName.setObjectName(u"txtName")
        self.txtName.setGeometry(QRect(160, 50, 171, 31))
        self.label = QLabel(Dialog)
        self.label.setObjectName(u"label")
        self.label.setGeometry(QRect(70, 60, 65, 14))
        font = QFont()
        font.setPointSize(12)
        self.label.setFont(font)
        self.label_2 = QLabel(Dialog)
        self.label_2.setObjectName(u"label_2")
        self.label_2.setGeometry(QRect(80, 110, 65, 14))
        self.label_2.setFont(font)
        self.txtPass = QLineEdit(Dialog)
        self.txtPass.setObjectName(u"txtPass")
        self.txtPass.setGeometry(QRect(160, 100, 171, 31))
        self.OKBtn = QPushButton(Dialog)
        self.OKBtn.setObjectName(u"OKBtn")
        self.OKBtn.setGeometry(QRect(160, 180, 80, 22))
        self.QuitBtn = QPushButton(Dialog)
        self.QuitBtn.setObjectName(u"QuitBtn")
        self.QuitBtn.setGeometry(QRect(270, 180, 80, 22))

        self.retranslateUi(Dialog)

        QMetaObject.connectSlotsByName(Dialog)
    # setupUi

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QCoreApplication.translate("Dialog", u"\u7528\u6237\u767b\u5f55\u7a97\u53e3", None))
        self.label.setText(QCoreApplication.translate("Dialog", u"\u7528\u6237\u540d\uff1a", None))
        self.label_2.setText(QCoreApplication.translate("Dialog", u"\u5bc6\u7801\uff1a", None))
        self.OKBtn.setText(QCoreApplication.translate("Dialog", u"\u786e\u5b9a", None))
        self.QuitBtn.setText(QCoreApplication.translate("Dialog", u"\u9000\u51fa", None))
    # retranslateUi

