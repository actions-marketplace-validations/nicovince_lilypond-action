FROM ubuntu:20.04
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y \
    lilypond \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /data/src

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
# Build:
# docker build -t gha_ly .
# Run:
# docker run -it -v $PWD:/data/src/ -w /data/src -u $(id -u ${USER}):$(id -g ${USER}) --rm gha_ly
