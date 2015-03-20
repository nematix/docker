FROM nematix/ubuntu
MAINTAINER "Azri Jamil" <azri@nematix.com>

# Dependencies
RUN apt-get update && apt-get install -y git php5-cli php5-json curl php5-mcrypt
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Volumes & folder
VOLUME ["/usr/local/bin"]
RUN mkdir -p /data/www
WORKDIR /data/www

# Entrypoint
ENTRYPOINT ["composer","--ansi"]
CMD ["-"]

# Cleanup
RUN apt-get remove --purge curl -y && apt-get clean
