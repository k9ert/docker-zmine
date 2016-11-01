FROM ubuntu:latest
RUN apt-get update -q && apt-get -qy install \
    build-essential pkg-config libc6-dev m4 g++-multilib \
    autoconf libtool ncurses-dev unzip git python \
    zlib1g-dev wget bsdmainutils automake

WORKDIR /root/  
RUN git clone https://github.com/str4d/zcash.git zminer
WORKDIR /root/zminer
RUN git checkout standalone-miner
RUN ./zcutil/build.sh -j$(nproc)

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
