import os
from socket import gethostname

from flask import Flask


NAME = os.environ.get("NAME", "world")
PORT = int(os.environ.get('PORT', '8080'))
host = gethostname()

print(f"hello app started with {NAME=} at {host=}")

app = Flask(__name__)


@app.get("/")
def handle():
    return f"Hello, {NAME}! @ {host}"


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=PORT)