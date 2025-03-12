import os
import sys
import inspect


class ImportMonitor:
    def find_spec(self, fullname, path, target=None):
        for frame in inspect.stack()[1:]:
            filename = frame.filename
            if filename.startswith("/"):
                break
        if "lib/python" in filename:
            return
        relative_filename = filename.replace(os.getcwd() + "/", "")
        print(f"{relative_filename} -> {fullname}")


sys.meta_path.insert(0, ImportMonitor())
