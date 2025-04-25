FROM --platform=$BUILDPLATFORM debian:bookworm-slim
ARG VSCODE_VERSION=1.99.3
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN curl -L "https://update.code.visualstudio.com/${VSCODE_VERSION}/cli-alpine-x64/stable" -o code.tar.gz && \
    tar -xzf code.tar.gz && \
    rm code.tar.gz && \
    chmod +x code
ENTRYPOINT ["/app/code"]
CMD ["serve-web"]