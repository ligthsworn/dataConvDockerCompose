FROM redis:6.0.7

ENV SRC_DIR=/data/lib
ENV PIP_SRC=${SRC_DIR}

WORKDIR ${SRC_DIR}

RUN apt-get update
RUN apt-get -y install \
    openssh-client \
    openssh-server \
    git \
    curl \
    python3 \
    libpq-dev \
    gcc \
    make \
    g++ \
    autoconf \
    automake \
    libtool \
    patch \
    musl-dev \
    libpcre3-dev \
    libpcre3 \
    python3-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev

# Link python to python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Create the src directory
RUN curl -o /data/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python /data/get-pip.py

RUN pip install rdbtools python-lzf
COPY redis/redis-rdb-tools /data/redis-rdb-tools
WORKDIR /data/redis-rdb-tools
RUN python setup.py install

RUN mkdir -p /home/redis

COPY redis/redis.conf /data/

RUN echo 'redis:password' | chpasswd

# RUN sysctl vm.overcommit_memory=1

WORKDIR /data
# CMD redis-server /data/redis.conf
