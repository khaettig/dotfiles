class PlainMessage:
    def __init__(self, text):
        self.text = text

    def __str__(self):
        return self.text

    def __repr__(self):
        return str(self)

    def __eq__(self, other):
        return str(self) == str(other)

    def render(self):
        print(self)

    def add_root_to_file_name(self, root):
        pass
