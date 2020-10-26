FROM alpine

RUN mkdir /data && \
    mkdir /build && \
    apk add --no-cache g++ make musl-dev libpcap libpcap-dev \
        linux-headers libcap dynamips vpcs \
        python3 python3-dev py3-pip

WORKDIR /build

RUN wget https://github.com/GNS3/ubridge/archive/v0.9.18.tar.gz && \
    tar -xf v0.9.18.tar.gz && \
    cd ubridge-0.9.18 && \
    make && \
    make install

RUN wget https://github.com/GNS3/gns3-server/archive/v2.2.15.tar.gz && \
    tar -xf v2.2.15.tar.gz && \
    cd gns3-server-2.2.15 && \
    python3 setup.py install

WORKDIR /

COPY config.ini /config.ini
COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
