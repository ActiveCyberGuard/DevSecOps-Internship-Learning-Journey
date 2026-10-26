from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def home():
    return jsonify(message="Local DAST training app")

@app.get("/health")
def health():
    return jsonify(status="healthy")

@app.get("/headers")
def headers():
    # Example endpoint for reviewing response headers.
    return jsonify(note="Review security headers at the HTTP response layer")
