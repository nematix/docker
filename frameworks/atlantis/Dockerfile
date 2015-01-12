FROM phusion/baseimage:latest

MAINTAINER "Azri Jamil" <azri@nematix.com>

ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]

# Installing required package
RUN apt-get update -y && apt-get -y upgrade
RUN apt-get install -y curl nginx php5-cli php5-json php5-mcrypt php5-gd php5-curl php5-pgsql

# Installing composer & package cleanup
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN apt-get remove --purge curl -y && apt-get clean

# Volume
RUN mkdir -p /data/www
WORKDIR /data/www
VOLUME ["/data"]

# Laravel configuration
COPY config/app.php config/app.php

RUN mkdir -p /data/www/workbench
WORKDIR /data/www/workbench
RUN git clone https://github.com/atlantisx/core.git
RUN git clone https://github.com/atlantisx/detail.git
RUN git clone https://github.com/atlantisx/admin.git
RUN git clone https://github.com/atlantisx/content.git
RUN git clone https://github.com/atlantisx/message.git

# PHP configuration
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
# RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

# Configure nginx for PHP websites
ADD nginx_default.conf /etc/nginx/sites-available/default
RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
RUN mkdir -p /var/www && chown -R www-data:www-data /var/www

# Ports exposure
EXPOSE 80
