# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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