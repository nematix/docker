FROM nematix/nginx
MAINTAINER "Azri Jamil" <azri@nematix.com>

# Package dependency & installing php5-fpm
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qqy
RUN apt-get install -y php5-cli php5-curl php5-fpm php5-mysql php-apc php5-gd php5-intl \
    php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps \
    php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-json php5-xdebug
RUN service php5-fpm stop

RUN mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d
ADD config/etc /etc
ADD config/init02 /config/init02
RUN php5enmod mcrypt gd curl xdebug

RUN echo xdebug.remote_enable=1 >> /etc/php5/mods-available/xdebug.ini;\
    echo xdebug.remote_autostart=1 >> /etc/php5/mods-available/xdebug.ini;\
    echo xdebug.remote_connect_back=0 >> /etc/php5/mods-available/xdebug.ini;\
    echo xdebug.remote_host=192.168.0.10 >> /etc/php5/mods-available/xdebug.ini;\
    echo xdebug.remote_port=9000 >> /etc/php5/mods-available/xdebug.ini;\
    echo xdebug.remote_handler=dbgp >> /etc/php5/mods-available/xdebug.ini;\
    echo xdebug.idekey=PHPSTORM >> /etc/php5/mods-available/xdebug.ini;\
    echo xdebug.remote_log=/data/logs/php5-xdebug.log >> /etc/php5/mods-available/xdebug.ini;
