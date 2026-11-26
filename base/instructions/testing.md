---
description: Rules for test files
globs: ["**/*_test.*", "**/*.test.*", "**/*.spec.*", "**/test_*.py", "**/tests/**"]
---

# Tests

- A test checks one behaviour and its name says which.
- Assert what the code promises, not how it does it.
- A test writes only into a temporary folder and needs no network.
- When you fix a bug, first add the test that fails because of it.
