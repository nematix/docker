FROM nematix/ubuntu
MAINTAINER Azri Jamil <azri@nematix.com>

ENV RIAK_VERSION 1.4.10
ENV RIAK_SHORT_VERSION 1.4
ENV RIAK_CS_VERSION 1.5.4
ENV RIAK_CS_SHORT_VERSION 1.5
ENV STANCHION_VERSION 1.5.0
ENV STANCHION_SHORT_VERSION 1.5

# Install and setup project dependencies
ADD config/etc /etc
RUN echo 'root:basho' | chpasswd

# Install riak
ADD http://s3.amazonaws.com/downloads.basho.com/riak/${RIAK_SHORT_VERSION}/${RIAK_VERSION}/ubuntu/precise/riak_${RIAK_VERSION}-1_amd64.deb /
RUN (cd / && dpkg -i "riak_${RIAK_VERSION}-1_amd64.deb")

# Install riak-cs
ADD http://s3.amazonaws.com/downloads.basho.com/riak-cs/${RIAK_CS_SHORT_VERSION}/${RIAK_CS_VERSION}/ubuntu/trusty/riak-cs_${RIAK_CS_VERSION}-1_amd64.deb /
RUN (cd / && dpkg -i "riak-cs_${RIAK_CS_VERSION}-1_amd64.deb")

# Install stanchion
ADD http://s3.amazonaws.com/downloads.basho.com/stanchion/${STANCHION_SHORT_VERSION}/${STANCHION_VERSION}/ubuntu/trusty/stanchion_${STANCHION_VERSION}-1_amd64.deb /
RUN (cd / && dpkg -i "stanchion_${STANCHION_VERSION}-1_amd64.deb")

# Riak configuration
RUN echo "ulimit -n 4096" >> /etc/default/riak && \
    sed -i.bak 's/\"127.0.0.1\", 8098/\"0.0.0.0\", 8098/' /etc/riak/app.config && \
    sed -i.bak "s/-env ERL_MAX_PORTS 16384/-env ERL_MAX_PORTS 64000/" /etc/riak/vm.args && \
    sed -i.bak "s/##+zdbbl 32768/+zdbbl 96000/" /etc/riak/vm.args

# Configuring riak-cs
RUN sed -i.bak "s/{cs_ip, \"127.0.0.1\"},/{cs_ip, \"0.0.0.0\"},/" /etc/riak-cs/app.config && \
    sed -i.bak "s/{fold_objects_for_list_keys, false},/{fold_objects_for_list_keys, true},/" /etc/riak-cs/app.config && \
    sed -i.bak "s/{anonymous_user_creation, false},/{anonymous_user_creation, true},/" /etc/riak-cs/app.config

# Configuring stanchion
RUN sed -i.bak "s/{stanchion_ip, \"127.0.0.1\"},/{stanchion_ip, \"0.0.0.0\"},/" /etc/stanchion/app.config

# Riak volume
VOLUME /var/lib/riak

# Expose Riak Protocol Buffers and HTTP interfaces
EXPOSE 8087 8098

# Cleanup & Entry
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /*.deb
