FROM nematix/ubuntu
MAINTAINER Azri Jamil <azri@nematix.com>

ENV MARIADB_DB NONE
ENV MARIADB_USER mysql

RUN apt-get update -qqy && apt-get -y upgrade
RUN apt-get install -y pwgen mariadb-server mariadb-client

RUN sed -i -e "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
RUN sed -i -e "s/^datadir.*=.*/datadir = \/data\/db/" /etc/mysql/my.cnf
RUN sed -i -e "s/^innodb_buffer_pool_size.*=.*/innodb_buffer_pool_size = 64M/" /etc/mysql/my.cnf

# Configurations
ADD config/etc /etc
ADD config/init03-mariadb /data/config/init03-mariadb

EXPOSE 3306
