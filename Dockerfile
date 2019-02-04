FROM openjdk:8-jdk-slim

RUN apt-get update && apt-get install -y  --no-install-recommends python curl \
    && rm -rf /var/lib/apt/lists/*

ENV PRESTO_VER=301
RUN mkdir -p /presto/data

RUN curl -SL https://repo1.maven.org/maven2/io/prestosql/presto-server/${PRESTO_VER}/presto-server-${PRESTO_VER}.tar.gz \
    | tar zx -C /presto --strip=1

COPY ./etc /presto/etc

CMD ["/presto/bin/launcher", "run"]