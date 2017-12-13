#################################################
#
# Builds a local NEO node with the
# CityofZion neo-python client
# 	- https://github.com/CityOfZion/neo-python
#
#################################################

# Build with
# 	- docker build -t avastmick/neo-node .
# Use from a dir with anything you'd need:
# 	- docker run -it --rm --net=neo-privnet  --volume $(pwd):/neo avastmick/neo-node  bash

FROM ubuntu:16.04
LABEL maintainer="avastmick"

ENV TINI_VERSION v0.16.1

# Install deps
RUN apt-get update && apt-get install -y \
    apt-utils \
    mininet netcat curl wget unzip less python3 screen \
    ca-certificates apt-transport-https \
    libleveldb-dev sqlite3 libsqlite3-dev \
    expect git \
	python3.5-dev python3-pip libssl-dev

# Install neo-python
RUN git clone https://github.com/CityOfZion/neo-python.git /opt/neo-python && \
	cd /opt/neo-python && git checkout origin/master
RUN pip3 install --upgrade pip && pip3 install -r /opt/neo-python/requirements.txt && pip3 install -e /opt/neo-python

# Add the config and wallet for the private testnet
ADD ./protocol.json /opt/neo-python/protocol.privnet.json

# Configure a working wallet
# ADD ./wallet/dev.db3 /opt/neo-python/

# TODO:
# 	- To init the faucet
# git clone https://github.com/CityOfZion/neo-faucet.git /opt/neo-faucet && \
# pip install -r /opt/neo-faucet/requirements.tx
# 

# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Expose the ports
EXPOSE 20332
EXPOSE 30332
