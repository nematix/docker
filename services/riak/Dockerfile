# Riak
#
# VERSION       0.1.0
FROM nematix/ubuntu
MAINTAINER Azri Jamil <azri@nematix.com>

# Environment
ENV RIAK_VERSION 2.0.0-1

# Install and setup project dependencies
COPY supervisor-riak.conf /etc/supervisor/conf.d/riak.conf
RUN echo 'root:basho' | chpasswd

# Install riak
RUN curl https://packagecloud.io/install/repositories/basho/riak/script.deb | sudo bash
RUN apt-get update -qqy && apt-get install -y riak=${RIAK_VERSION}

# Riak configuration
RUN sed -i.bak "s/riak@127.0.0.1/riak@0.0.0.0/" /etc/riak/riak.conf
RUN sed -i.bak "s/listener.http.internal = 127.0.0.1:8098/listener.http.internal = 0.0.0.0:8098/" /etc/riak/riak.conf
RUN sed -i.bak "s/listener.protobuf.internal = 127.0.0.1:8087/listener.protobuf.internal = 0.0.0.0:8087/" /etc/riak/riak.conf
RUN echo "ulimit -n 4096" >> /etc/default/riak

# Expose Riak Protocol Buffers and HTTP interfaces
EXPOSE 8087 8098

# Cleanup & Entry
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
