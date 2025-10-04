import unittest
from src.hello import hello

class HelloTest(unittest.TestCase):
    def test_hello(self):
        self.assertEqual(hello(), "Hello, Codex!")

if __name__ == "__main__":
    unittest.main()
