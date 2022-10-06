from PyQt5 import QtWidgets as qtw


class Window(qtw.QDialog):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Quick Capture")

        self.input = qtw.QLineEdit()
        self.submit_button = qtw.QPushButton("Save")
        self.submit_button.clicked.connect(self.submit)

        layout = qtw.QGridLayout()
        layout.addWidget(self.input, 0, 0)
        layout.addWidget(self.submit_button, 1, 0)
        self.setLayout(layout)

    def submit(self):
        qtw.QApplication.quit()


if __name__ == '__main__':
    app = qtw.QApplication([])
    window = Window()
    window.show()
    app.exec()

    with open("/home/kevin/Notes/Incoming.md", "a") as f:
        f.write(window.input.text() + "\n")
