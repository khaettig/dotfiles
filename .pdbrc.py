import logging
from pdb import DefaultConfig


class Config(DefaultConfig):
    sticky_by_default = True

    def setup(self, pdb):
        logging.disable()
