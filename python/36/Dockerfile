FROM python:3.6-slim
LABEL maintainer="Diego Gutierrez <dgutierrez1287@gmail.com>"

RUN apt update && \
    apt install -y zip && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV BUILD_TYPE "local"
VOLUME /source

COPY ../entrypoint.sh /root/entrypoint.sh
RUN chmod 755 /root/entrypoint.sh
ENTRYPOINT [ "/root/entrypoint.sh" ]