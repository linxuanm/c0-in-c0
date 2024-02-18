import os
import unittest
import subprocess


# Unit tests (located under `/test_cases` directory) have the naming format
# `<error_id>_<name>.c0`, where `<error_id>` is the expected exit code of
# invoking the `ccc0` compiler with the given test case.
TESTS_FAIL_DIR = "test_cases/fail"

class TestCompilerExitCode(unittest.TestCase):
    pass


def generate_exit_code_test(file_name: str, exit_code: int):

    def test(self):
        result = subprocess.run(
            ["./ccc0", "--test", file_name],
            capture_output=True
        )

        stdout = result.stdout.decode('utf-8').strip()
        ret_code = int(stdout.split("\n")[-1])

        if ret_code == 1:
            self.fail(
                f"Test case '{file_name}' broke compiler. "
                f"Compiler output: {result.stderr.decode('utf-8')}"
            )

        self.assertEqual(ret_code, exit_code)

    return test


# generate failure tests
for file_name in os.listdir(TESTS_FAIL_DIR):
    if file_name.endswith(".c0"):
        prefix = file_name.split("_")[0]

        if not prefix.isdigit():
            raise ValueError(
                f"Test case file name '{file_name}' does not start with exit "
                "code prefix. Files should be named '<exit_code>_<name>.c0'"
            )

        exit_code = int(prefix)
        test_name = "test_" + file_name.split(".")[0].split("_", 1)[1]
        test = generate_exit_code_test(
            os.path.join(TESTS_FAIL_DIR, file_name),
            exit_code
        )
        setattr(TestCompilerExitCode, test_name, test)


if __name__ == "__main__":
    unittest.main()
