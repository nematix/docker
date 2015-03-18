FROM debian:jessie
MAINTAINER "Azri Jamil" <azri@nematix.com>

# Dependencies
RUN apt-get update && apt-get install -y git php5-cli php5-json curl php5-mcrypt
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Cleanup
RUN apt-get remove --purge curl -y && apt-get clean

# Display version information
RUN php --version
RUN composer --version

# Volumes & folder
RUN mkdir -p /data/www
VOLUME ["/data","/usr/local/bin"]
WORKDIR /data/www

# Entrypoint
ENTRYPOINT ["composer","--ansi"]
CMD ["-"]
