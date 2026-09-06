from app.app import calculate_discount, is_positive


def test_discount():
    assert calculate_discount(1000, 10) == 900


def test_positive():
    assert is_positive(10) is True


def test_negative():
    assert is_positive(-5) is False
    print("CI/CD test lab by MD.AL-AMIN")