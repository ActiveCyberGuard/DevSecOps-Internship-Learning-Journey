# Project 01 — Basic Python CI

## Test Lab by MD.AL-AMIN

This project demonstrates a basic Continuous Integration (CI) pipeline using Python, Pytest, and GitHub Actions.

---

## Objective

The objective of this project is to understand how a CI pipeline automatically runs application tests whenever code is pushed to GitHub.

---

## Technologies

* Python
* Pytest
* Git
* GitHub
* GitHub Actions

---

## Project Structure

```text
project-01-basic-python-ci/
├── app/
│   └── app.py
├── tests/
│   └── test_app.py
├── requirements.txt
└── README.md
```

---

## Application

The application contains basic mathematical operations:

* Addition
* Subtraction
* Multiplication
* Division
* Division-by-zero validation

The application also displays:

```text
Test Lab by MD.AL-AMIN
```

when executed directly.

---

## Run Locally

Install dependencies:

```bash
py -m pip install -r requirements.txt
```

Run the application:

```bash
py app/app.py
```

Run tests:

```bash
py -m pytest
```

Expected result:

```text
5 passed
```

---

## CI Pipeline

The GitHub Actions workflow performs:

```text
Git Push
   ↓
Checkout Repository
   ↓
Setup Python 3.12
   ↓
Install Dependencies
   ↓
Run Pytest
   ↓
CI PASS
```

---

## Learning Outcome

This project demonstrates the foundation of Continuous Integration and shows how automated testing can be integrated into a GitHub repository.

---

## Author

**MD.AL-AMIN**

**Test Lab by MD.AL-AMIN**
