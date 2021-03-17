from src.common.message import Message


class SubMessage(Message):
    def __init__(self, code, text, file_name=None, line_number=None):
        self.code = code
        self.text = text
        self._file_name = file_name
        self._line_number = line_number

        self.parent = None

    @property
    def module_name(self):
        return self.parent.module_name

    @property
    def file_name(self):
        return self._file_name if self._file_name else self.parent.file_name

    @property
    def line_number(self):
        return self._line_number if self._line_number else self.parent.line_number
