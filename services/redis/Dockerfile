FROM nematix/ubuntu
MAINTAINER Azri Jamil <azri@nematix.com>

# Installing required package
RUN apt-get update -qqy && apt-get -y upgrade
RUN apt-get update && apt-get install -y redis-server

# Adding support files to container
ADD config/etc /etc

# Expose redis port
EXPOSE 6379
