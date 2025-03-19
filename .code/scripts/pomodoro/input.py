from PyQt5 import QtGui as qtg
from PyQt5 import QtWidgets as qtw


def ask_for_input():
    app = qtw.QApplication([])
    window = Window()
    window.show()
    app.exec()
    return {
        "minutes": int(window.minutes_input.text()),
        "delay": int(window.delay_input.text()),
        "goal": window.goal_input.text(),
        "categories": [
            x.strip()
            for x in window.category_input.text().split(",")
            if x.strip() != ""
        ],
    }


class Window(qtw.QDialog):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Start Timer")

        self.goal_input = qtw.QLineEdit()
        self.minutes_input = qtw.QLineEdit("25")
        self.minutes_input.setValidator(qtg.QIntValidator(1, 999))
        self.delay_input = qtw.QLineEdit("0")
        self.delay_input.setValidator(qtg.QIntValidator(1, 999))
        self.category_input = qtw.QLineEdit()
        self.submit_button = qtw.QPushButton("Start")
        self.submit_button.clicked.connect(self.submit)

        layout = qtw.QGridLayout()
        layout.addWidget(qtw.QLabel("Goal:"), 0, 0, 1, 1)
        layout.addWidget(self.goal_input, 0, 1, 1, 3)
        layout.addWidget(qtw.QLabel("Project:"), 1, 0, 1, 1)
        layout.addWidget(self.category_input, 1, 1, 1, 3)
        layout.addWidget(qtw.QLabel("Minutes:"), 2, 0, 1, 1)
        layout.addWidget(self.minutes_input, 2, 1, 1, 3)
        layout.addWidget(qtw.QLabel("Delay:"), 3, 0, 1, 1)
        layout.addWidget(self.delay_input, 3, 1, 1, 1)
        layout.addWidget(self.submit_button, 3, 3, 1, 1)
        self.setLayout(layout)

    def submit(self):
        qtw.QApplication.quit()


if __name__ == '__main__':
    print(ask_for_input())
