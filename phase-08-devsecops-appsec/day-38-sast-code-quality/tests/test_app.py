import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "app"))
from app import app  # noqa: E402

def test_home():
    response = app.test_client().get("/")
    assert response.status_code == 200
    assert response.json["message"] == "DevSecOps SAST practice app"

def test_health():
    response = app.test_client().get("/health")
    assert response.status_code == 200
    assert response.json["status"] == "healthy"
