
import pymysql

from PySide6.QtCore import *
from PySide6.QtGui import *
from PySide6.QtWidgets import *
from PySide6.QtUiTools import QUiLoader

 
class WinUI:
    def __init__(self):
        self.ui = QUiLoader().load("/home/oyy/qtdesigner/UILoader/myui.ui") 
        self.ui.OKBtn.clicked.connect(self.OKfun)
        self.ui.QuitBtn.clicked.connect(self.Quitfun)
    def OKfun(self):
        mName=self.ui.txtName.text()
        mPass=self.ui.txtPass.text()
        print(mName+mPass)
    def Quitfun(self):
        self.ui.close()
app = QApplication([])
win = WinUI()
win.ui.show()
app.exec()
