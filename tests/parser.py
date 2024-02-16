import unittest
import subprocess

class ExternalExecutableTestCase(unittest.TestCase):
    def test_executable_output(self):
        command = ['external_executable', 'arg1', 'arg2']
        
        # Run the external executable
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = process.communicate()
        
        # Assert the expected output or behavior
        self.assertEqual(process.returncode, 0)  # Example: Check if the return code is 0
        self.assertIn(b'expected_output', stdout)  # Example: Check if the expected output is present
        self.assertNotIn(b'error_message', stderr)  # Example: Check if there are no error messages

if __name__ == '__main__':
    unittest.main()