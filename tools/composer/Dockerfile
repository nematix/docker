FROM debian:jessie
MAINTAINER "Azri Jamil" <azri@nematix.com>

WORKDIR /tmp

RUN apt-get update -qqy
RUN apt-get install -y git php5-cli php5-json curl php5-mcrypt
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN apt-get remove --purge curl -y && apt-get clean

# Volumes & folder
VOLUME ["/usr/local/bin"]
RUN mkdir -p /data/www
WORKDIR /data/www

# Entrypoint
ENTRYPOINT ["composer"]
CMD ["--help"]
