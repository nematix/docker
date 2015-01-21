FROM nematix/ubuntu
MAINTAINER Azri Jamil <azri@nematix.com>

# Installing required package
RUN apt-get update -qqy && apt-get -y upgrade
RUN apt-get update && apt-get install -y redis-server

# Adding support files to container
ADD config/etc /etc
ADD config/init03-redis /config/init03-redis
RUN sed -i -e "s/dir \/var\/lib\/redis/dir \/data\/redis/" /etc/redis/redis.conf
RUN sed -i -e "s/logfile \/var\/log\/redis\/redis-server.log/logfile \/data\/logs\/redis.log/" /etc/redis/redis.conf

# Expose redis port
EXPOSE 6379
