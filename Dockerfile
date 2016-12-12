FROM ubuntu:precise

MAINTAINER Johann M. Kraus <johann.kraus@uni-ulm.de>

WORKDIR /home/rbm
COPY cudd-cudd-2.4.1 /home/rbm/cudd-cudd-2.4.1

RUN apt-get update && apt-get install -y git \
    make \
    g++ \
    libreadline-dev \
    libncurses5-dev \
    libgmp-dev \
 && cd cudd-cudd-2.4.1 \
 && make \
 && cd .. \
 && git clone https://github.com/vscosta/yap-6.3.git \
 && cd yap-6.3 \
 && git checkout -b 6.3.0 6.3.0 \
 && ./configure --with-cudd="/home/rbm/cudd-cudd-2.4.1" --enable-tabling=yes \
 && make \
 && make install \
 && cd .. \
 && apt-get purge -y git \
    make \
    g++ \
    libreadline-dev \
    libncurses5-dev \
    libgmp-dev \
 && apt-get autoremove -y \
 && apt-get install -y libreadline5 \
    libncurses5 \
    libgmp10 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && rm -rf yap-6.3 cudd-cudd-2.4.1
