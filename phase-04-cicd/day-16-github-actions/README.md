# Day 16 — Matrix CI

## 1. Objective

The objective of this module was to understand and implement **Matrix CI** using GitHub Actions.

The application was tested automatically across multiple Python versions:

* Python 3.10
* Python 3.11
* Python 3.12

The main goal was to ensure that the application and its tests work correctly across different Python environments.

---

## 2. Topics Learned

During this module, I learned:

* GitHub Actions Matrix Strategy
* Automated testing with GitHub Actions
* Testing across multiple Python versions
* `strategy.matrix`
* `actions/setup-python`
* Pytest integration with CI
* GitHub Actions workflow paths
* CI job execution and monitoring

---

## 3. Application

The application contains two simple functions.

### `calculate_discount()`

Calculates the final price after applying a discount.

### `is_positive()`

Checks whether a number is positive.

---

## 4. Project Structure

```text
day-16-github-actions/
├── app/
│   └── app.py
├── tests/
│   └── test_app.py
├── screenshots/
│   ├── 04-day16-local-test.png
│   └── 05-day16-matrix-success.png
├── requirements.txt
└── README.md
```

---

## 5. Local Testing

The required dependencies were installed using:

```bash
python -m pip install -r requirements.txt
```

The tests were executed using:

```bash
pytest
```

### Test Result

```text
3 passed
```

The local test execution was successful.

---

## 6. Matrix CI Workflow

A GitHub Actions workflow was created to test the application against three Python versions:

```text
Python 3.10
Python 3.11
Python 3.12
```

The workflow uses the GitHub Actions Matrix Strategy:

```yaml
strategy:
  matrix:
    python-version:
      - "3.10"
      - "3.11"
      - "3.12"
```

This allows the same test suite to run automatically in multiple environments.

---

## 7. GitHub Actions Workflow

Workflow file:

```text
.github/workflows/phase4-day16-matrix-ci.yml
```

The workflow performs the following steps:

1. Checkout the repository
2. Setup the selected Python version
3. Install project dependencies
4. Run Pytest

---

## 8. Matrix CI Result

The GitHub Actions workflow successfully executed the tests across:

```text
✓ Python 3.10
✓ Python 3.11
✓ Python 3.12
```

All matrix jobs completed successfully.

---

## 9. Screenshots

### Local Test

![Day 16 Local Test](screenshots/04-day16-local-test.png)

### Matrix CI Success

![Day 16 Matrix CI Success](screenshots/05-day16-matrix-success.png)

---

## 10. Key Takeaway

Matrix CI allows the same application to be tested automatically across multiple environments.

Instead of creating separate workflows for each Python version, GitHub Actions can use a matrix strategy to run the same job for multiple versions.

This improves CI reliability and helps identify compatibility issues early.

---

## 11. Conclusion

Day 16 provided practical experience with GitHub Actions Matrix CI.

I successfully implemented automated testing for Python 3.10, Python 3.11, and Python 3.12 using a single GitHub Actions workflow.
