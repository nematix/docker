FROM debian:jessie
MAINTAINER "Azri Jamil" <azri@nematix.com>

WORKDIR /tmp

RUN apt-get update -qqy && apt-get upgrade -y
RUN apt-get install -y \
php5-cli \
php5-mcrypt \
php5-mongo \
php5-mssql \
php5-mysqlnd \
php5-pgsql \
php5-redis \
php5-sqlite \
php5-gd
RUN apt-get clean

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["php", "artisan"]
CMD ["--help"]
