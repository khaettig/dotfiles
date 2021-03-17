class Message:
    def __init__(self, code, module_name, file_name, line_number, text):
        self.code = code
        self.module_name = module_name
        self.file_name = file_name
        self.line_number = line_number
        self.text = text
        self.sub_messages = []

    def __str__(self):
        return ":".join(
            [
                str(attribute)
                for attribute in [
                    self.code,
                    self.module_name,
                    self.file_name,
                    self.line_number,
                    self.text.split("\n")[0],
                ]
            ]
        )

    def __repr__(self):
        return str(self)

    def __eq__(self, other):
        return str(self) == str(other)

    def add(self, sub_message):
        self.sub_messages.append(sub_message)
        sub_message.parent = self

    def render(self):
        print(self)
        for sub_message in self.sub_messages:
            print(sub_message)
