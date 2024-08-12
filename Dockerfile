FROM docker.io/library/rust:1-slim
COPY rust-toolchain.toml .
RUN cargo install trunk@0.20.3 --locked
