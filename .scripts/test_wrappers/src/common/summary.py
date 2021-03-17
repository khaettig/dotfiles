class Summary:
    def __init__(self, passed=0, failed=0, skipped=0, total=0, message=None):
        self.passed = passed
        self.failed = failed
        self.skipped = skipped
        self.total = total
        self.message = message

    def __str__(self):
        counts = f"{self.passed}P {self.failed}F {self.skipped}P {self.total}T"
        return "SUMMARY: " + (self.message if self.message else counts)

    def __repr__(self):
        return str(self)

    def __eq__(self, other):
        return (
            self.passed == other.passed
            and self.failed == other.failed
            and self.skipped == other.skipped
            and self.total == other.total
            and self.message == other.message
        )
