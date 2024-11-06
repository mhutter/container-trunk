FROM docker.io/curlimages/curl:latest AS curl
WORKDIR /work

ENV TRUNK_VERSION=0.21.3
ENV FILENAME=trunk-x86_64-unknown-linux-gnu.tar.gz
ENV URL="https://github.com/trunk-rs/trunk/releases/download/v${TRUNK_VERSION}/${FILENAME}"

RUN curl -LOv --retry 5 "${URL}.sha256"
RUN curl -LOv --retry 5 "${URL}"
RUN echo "$(cat ${FILENAME}.sha256) $FILENAME" | sha256sum -c -
RUN tar -xzvf "$FILENAME"


FROM docker.io/library/rust:1-slim
COPY --from=curl /work/trunk /usr/local/bin
