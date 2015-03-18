FROM nematix/nginx
MAINTAINER "Azri Jamil" <azri@nematix.com>

# Package dependency & installing php5-fpm
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y php5-cli php5-curl php5-fpm php5-mysql php-apc php5-gd php5-intl \
    php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps \
    php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-json php5-xdebug

# PHP
RUN service php5-fpm stop
RUN php5enmod mcrypt gd curl xdebug

# Configurations
RUN mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d
ADD config/etc /etc
ADD config/init02 /config/init02

# Cleanup & Entrypoint
RUN apt-get -y clean
