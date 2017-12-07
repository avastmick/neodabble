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
# 	- docker run -it --volume `pwd`:/neo avastmick/neo-node  bash

FROM ubuntu:16.04
LABEL maintainer="avastmick"

ENV TINI_VERSION v0.16.1

# Install deps
RUN apt-get update && apt-get install -y \
    apt-utils \
    mininet netcat curl wget unzip less python3 screen \
    ca-certificates apt-transport-https \
    libleveldb-dev sqlite3 libsqlite3-dev \
    expect \
	git-core python3.5-dev python3-pip libssl-dev

# Install neo-python
RUN git clone https://github.com/CityOfZion/neo-python.git /opt/neo-python && \
	cd /opt/neo-python && git checkout origin/master && \
    pip3 install -r /opt/neo-python/requirements.txt && pip3 install -e
#
#  TODO:
# 
# Configure
# 	- To attach to local test node
# 	- To initialize a wallet
# TODO:
# 	- To init the faucet
# git clone https://github.com/CityOfZion/neo-faucet.git
# cd neo-faucet
# python3 -m venv venv
# source venv/bin/activate
# pip install -e ../neo-python
# pip install -r requirements.tx
# 

# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Run your program under Tini
CMD ["python", "/opt/prompt.py"]
