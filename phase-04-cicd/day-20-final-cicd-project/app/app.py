from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify({
        "application": "DevSecOps CI/CD Platform",
        "version": "1.0",
        "status": "running"
    })


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    })


@app.route("/api/info")
def info():
    return jsonify({
        "environment": "staging",
        "pipeline": "GitHub Actions"
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
