# Day 17 — Quality Gate

## 1. Objective

The objective of Day 17 was to understand and implement a **Quality Gate** in a CI/CD pipeline.

A Quality Gate ensures that application code meets predefined quality requirements before it is considered successful.

In this practical lab, the CI pipeline performs three main quality checks:

* Automated Testing
* Code Linting
* Code Coverage

The main concept is:

> **Test + Lint + Coverage = Quality Gate**

---

# 2. Topics Learned

During this module, I learned:

* Quality Gates in CI/CD
* Automated Unit Testing
* Pytest
* Code Linting
* Flake8
* Code Coverage
* pytest-cov
* GitHub Actions
* CI Pipeline Validation
* Intentional Pipeline Failure Testing
* Failure Detection and Recovery

---

# 3. Project Structure

```text
day-17-quality-gates/
│
├── app/
│   ├── __init__.py
│   └── calculator.py
│
├── tests/
│   └── test_calculator.py
│
├── screenshots/
│   ├── 06-day17-quality-local.png
│   ├── 07-day17-quality-gate-failure.png
│   └── 08-day17-quality-gate-success.png
│
├── requirements.txt
└── README.md
```

GitHub Actions workflow:

```text
.github/
└── workflows/
    └── phase4-day17-quality-gate.yml
```

---

# 4. Application

The application contains a simple calculator with four basic operations:

* Addition
* Subtraction
* Multiplication
* Division

It also includes validation for division by zero.

### `app/calculator.py`

```python
def add(a, b):
    return a + b


def subtract(a, b):
    return a - b


def multiply(a, b):
    return a * b


def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b
```

---

# 5. Automated Testing

Unit tests were written using **Pytest**.

The test suite verifies:

* Addition
* Subtraction
* Multiplication
* Division
* Division by zero handling

### `tests/test_calculator.py`

```python
import pytest

from app.calculator import add, subtract, multiply, divide


def test_add():
    assert add(5, 3) == 8


def test_subtract():
    assert subtract(5, 3) == 2


def test_multiply():
    assert multiply(5, 3) == 15


def test_divide():
    assert divide(10, 2) == 5


def test_divide_by_zero():
    with pytest.raises(ValueError):
        divide(10, 0)
```

---

# 6. Requirements

The project uses the following Python packages:

```text
pytest
pytest-cov
flake8
```

Install dependencies with:

```bash
py -m pip install -r requirements.txt
```

---

# 7. Run Unit Tests

To execute the test suite locally:

```bash
py -m pytest
```

Expected result:

```text
5 passed
```

All five test cases passed successfully.

---

# 8. Code Linting

**Flake8** was used to check the Python source code for formatting and coding-style issues.

Run:

```bash
py -m flake8 app tests
```

If no output is displayed, the code passed the linting check successfully.

```text
Flake8: PASS ✅
```

---

# 9. Code Coverage

Code coverage was generated using `pytest-cov`.

Run:

```bash
py -m pytest --cov=app --cov-report=term-missing
```

The coverage report shows how much of the application code is executed by the automated tests.

A high coverage percentage indicates that most of the application code is covered by tests.

---

# 10. GitHub Actions Quality Gate

The CI workflow is located at:

```text
.github/workflows/phase4-day17-quality-gate.yml
```

The workflow automatically performs the following checks:

```text
Checkout Repository
        ↓
Setup Python 3.12
        ↓
Install Dependencies
        ↓
Run Tests
        ↓
Run Flake8
        ↓
Generate Coverage
        ↓
Upload Coverage Report
```

The workflow runs when changes are pushed to the `main` branch or when a Pull Request targets the `main` branch.

---

# 11. Quality Gate Workflow

The pipeline contains three major quality checks:

### 1. Test

```bash
PYTHONPATH=. pytest
```

This verifies that the application behaves as expected.

### 2. Lint

```bash
flake8 app tests
```

This checks the code for style and formatting problems.

### 3. Coverage

```bash
PYTHONPATH=. pytest --cov=app --cov-report=term-missing --cov-report=xml
```

This generates a code coverage report.

The pipeline is considered successful only when the required checks complete successfully.

---

# 12. Intentional Quality Gate Failure

To demonstrate how a Quality Gate detects problems, the `add()` function was intentionally modified.

Original:

```python
def add(a, b):
    return a + b
```

Temporarily changed to:

```python
def add(a, b):
    return a + b + 1
```

This introduced an intentional test failure.

Running:

```bash
py -m pytest
```

caused the test suite to fail because:

```text
Expected: 8
Received: 9
```

The change was then committed and pushed to GitHub to demonstrate a failed CI pipeline.

Screenshot:

```text
screenshots/07-day17-quality-gate-failure.png
```

---

# 13. Fix and Recovery

After confirming that the Quality Gate correctly detected the problem, the application was restored.

The correct implementation is:

```python
def add(a, b):
    return a + b
```

The tests were executed again:

```bash
py -m pytest
```

Then linting and coverage were also verified:

```bash
py -m flake8 app tests
```

```bash
py -m pytest --cov=app --cov-report=term-missing
```

After all local checks passed, the fix was committed and pushed to GitHub.

The GitHub Actions pipeline then completed successfully.

Screenshot:

```text
screenshots/08-day17-quality-gate-success.png
```

---

# 14. Screenshots

## Local Quality Checks

![Day 17 Local Quality Checks](screenshots/06-day17-quality-local.png)

## Quality Gate Failure

![Day 17 Quality Gate Failure](screenshots/07-day17-quality-gate-failure.png)

## Quality Gate Success

![Day 17 Quality Gate Success](screenshots/08-day17-quality-gate-success.png)

---

# 15. Key Takeaway

A Quality Gate is an important part of a reliable CI/CD pipeline.

It helps prevent low-quality or broken code from progressing through the development and deployment process.

In this practical lab, the Quality Gate was implemented using:

```text
Pytest
   +
Flake8
   +
Code Coverage
   ↓
Quality Gate
   ↓
GitHub Actions
```

The intentional failure test also demonstrated that the pipeline can detect application problems automatically.

---

# 16. Conclusion

Day 17 provided practical experience with implementing a **CI/CD Quality Gate** using GitHub Actions.

I learned how to:

* Write automated unit tests
* Run tests using Pytest
* Perform code quality checks using Flake8
* Generate code coverage reports
* Configure GitHub Actions
* Detect pipeline failures
* Fix failed builds
* Validate the complete CI pipeline

This practical implementation demonstrates how automated quality checks can improve software reliability and help maintain consistent code quality throughout the CI/CD lifecycle.
