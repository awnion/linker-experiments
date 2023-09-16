#syntax=docker/dockerfile:1.6.0

FROM rust:1.72.0 as builder

RUN <<EOF
    apt update -yq
    apt install -yq \
        build-essential \
        cmake \
        perl \
        curl \
        clang \
        libssl-dev \
        librocksdb-dev \
        protobuf-compiler \
        musl-dev \
        musl-tools \
        llvm \
        python3-pip
    PIP_BREAK_SYSTEM_PACKAGES=1 pip3 install ziglang
EOF

RUN <<EOF
    rustup update --no-self-update stable
    rustup target add x86_64-unknown-linux-musl
    rustup target add aarch64-unknown-linux-musl
EOF

RUN cargo install cargo-zigbuild
