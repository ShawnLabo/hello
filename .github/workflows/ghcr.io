name: GitHub Container Registry

on:
  push:
    branches:
      - main

jobs:
  build_and_push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: docker/setup-buildx-action@v1
      - uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.CR_PAT }}
      - uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: |
            ghcr.io/shawnlabo/hello:latest
            ghcr.io/shawnlabo/hello:${{ github.sha }}
