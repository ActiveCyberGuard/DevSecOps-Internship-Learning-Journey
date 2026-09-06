from app.app import add, multiply


def test_add():
    assert add(2, 3) == 5
    print("Hi Alamin! this is the CICD Lab test-01")


def test_multiply():
    assert multiply(4, 5) == 20
    print("Hi Alamin! this is the CICD Lab test-02")