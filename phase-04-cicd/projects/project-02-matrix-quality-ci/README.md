# Project 02 — Matrix Quality CI

## Test Lab by MD.AL-AMIN

This project demonstrates a multi-version Continuous Integration pipeline using GitHub Actions.

---

## Objective

The objective is to test the same Python application against multiple Python versions while enforcing basic code quality checks.

---

## Technologies

* Python
* Pytest
* Flake8
* GitHub Actions
* Git

---

## Python Matrix

The CI pipeline tests:

```text
Python 3.10
Python 3.11
Python 3.12
```

---

## Project Structure

```text
project-02-matrix-quality-ci/
├── app/
│   └── calculator.py
├── tests/
│   └── test_calculator.py
├── requirements.txt
└── README.md
```

---

## Quality Checks

The pipeline performs:

1. Application testing
2. Flake8 linting
3. Python version matrix testing

Pipeline:

```text
Git Push
    ↓
GitHub Actions
    ↓
Python Matrix
 ┌────┼────┐
3.10  3.11  3.12
 └────┼────┘
      ↓
    Pytest
      ↓
    Flake8
      ↓
 Quality Gate
```

---

## Local Testing

Install dependencies:

```bash
py -m pip install -r requirements.txt
```

Run tests:

```bash
py -m pytest
```

Run lint:

```bash
py -m flake8 app tests
```

---

## Learning Outcome

This project demonstrates matrix-based CI, automated testing, linting, and quality gates.

---

## Author

**MD.AL-AMIN**

**Test Lab by MD.AL-AMIN**
