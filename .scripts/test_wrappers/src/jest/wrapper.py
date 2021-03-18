from src.common import Wrapper, Message, Summary


class JestWrapper(Wrapper):
    command = ["jest", "--json"]

    def parse(self, stdout, stderr):
        return [], Summary()
