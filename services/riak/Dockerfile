# Riak
#
# VERSION       0.1.0
FROM nematix/ubuntu
MAINTAINER Azri Jamil <azri@nematix.com>

ENV RIAK_CS_VERSION 1.5.4
ENV RIAK_CS_SHORT_VERSION 1.5
ENV STANCHION_VERSION 1.5.0
ENV STANCHION_SHORT_VERSION 1.5

# Install and setup project dependencies
COPY supervisor-riak.conf /etc/supervisor/conf.d/riak.conf
RUN echo 'root:basho' | chpasswd


RUN curl https://packagecloud.io/gpg.key | sudo apt-key add - && \
    curl http://apt.basho.com/gpg/basho.apt.key | sudo apt-key add -

# Install riak
RUN echo "deb https://packagecloud.io/basho/riak/ubuntu/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/basho.list && \
    echo "deb-src https://packagecloud.io/basho/riak/ubuntu/ $(lsb_release -cs) main" >> /etc/apt/sources.list.d/basho.list
RUN apt-get update && apt-get install -y riak

# Install riak-cs
RUN curl https://packagecloud.io/install/repositories/basho/riak-cs/script.deb | sudo bash
RUN apt-get update && apt-get install -y riak-cs

# Install stanchion
ADD http://s3.amazonaws.com/downloads.basho.com/stanchion/${STANCHION_SHORT_VERSION}/${STANCHION_VERSION}/ubuntu/trusty/stanchion_${STANCHION_VERSION}-1_amd64.deb /tmp
RUN (dpkg -i "stanchion_${STANCHION_VERSION}-1_amd64.deb")

# Riak configuration
RUN echo "ulimit -n 4096" >> /etc/default/riak
#RUN sed -i.bak 's/127.0.0.1/0.0.0.0/' /etc/riak/app.config

RUN sed -i.bak 's/\"127.0.0.1\", 8098/\"0.0.0.0\", 8098/' /etc/riak/app.config && \
    sed -i.bak "s/-env ERL_MAX_PORTS 16384/-env ERL_MAX_PORTS 64000/" /etc/riak/vm.args && \
    sed -i.bak "s/##+zdbbl 32768/+zdbbl 96000/" /etc/riak/vm.args && \
    sed -i.bak "s/{cs_ip, \"127.0.0.1\"},/{cs_ip, \"0.0.0.0\"},/" /etc/riak-cs/app.config && \
    sed -i.bak "s/{fold_objects_for_list_keys, false},/{fold_objects_for_list_keys, true},/" /etc/riak-cs/app.config && \
    sed -i.bak "s/{anonymous_user_creation, false},/{anonymous_user_creation, true},/" /etc/riak-cs/app.config && \
    sed -i.bak "s/{stanchion_ip, \"127.0.0.1\"},/{stanchion_ip, \"0.0.0.0\"},/" /etc/stanchion/app.config \
    sed -i.bak "s/127.0.0.1/${IP_ADDRESS}/" /etc/riak/vm.args \
    sed -i.bak "s/127.0.0.1/${IP_ADDRESS}/" /etc/riak-cs/vm.args \
    sed -i.bak "s/127.0.0.1/${IP_ADDRESS}/" /etc/stanchion/vm.args

VOLUME /var/lib/riak

# Expose Riak Protocol Buffers and HTTP interfaces
EXPOSE 8087 8098

# Cleanup & Entry
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
