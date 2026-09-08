from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    return "Test Lab by MD.AL-AMIN - Deployment v1"


@app.route("/health")
def health():
    return "healthy"


@app.route("/version")
def version():
    return "version: 1.0"


if __name__ == "__main__":
    print("=================================")
    print("Test Lab by MD.AL-AMIN")
    print("=================================")
    print("Docker Deployment Application")

    app.run(host="0.0.0.0", port=5000)