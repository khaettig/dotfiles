from src.common.wrapper import Wrapper
from src.common.message import Message
from src.common.sub_message import SubMessage


class PytestWrapper(Wrapper):
    command = ["pytest", "--json"]

    def parse(self, stdout, stderr):
        return [], ""
