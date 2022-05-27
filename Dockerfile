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

FROM python:3.10-slim-bullseye

LABEL org.opencontainers.image.source https://github.com/ShawnLabo/hello

ENV POETRY_NO_INTERACTION=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

WORKDIR /app

RUN pip install poetry

COPY poetry.toml /app/
COPY poetry.lock /app/
COPY pyproject.toml /app/
RUN poetry install --no-dev

COPY . /app

CMD ["sh", "-c", "poetry run waitress-serve --host 0.0.0.0 --port $PORT main:app"]