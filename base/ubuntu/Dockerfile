FROM phusion/baseimage:latest
MAINTAINER "Azri Jamil" <azri@nematix.com>

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]

# Package dependency
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qqy
RUN apt-get install -y inotify-tools supervisor net-tools procps vim
RUN service supervisor stop

# Centralized data path
ENV HOME /data
RUN mkdir -p /config /data/logs/supervisor
ADD config/entrypoint.sh /config/entrypoint.sh
ADD config/supervisord.conf /etc/supervisor/supervisord.conf
RUN chmod +x /config/entrypoint.sh
RUN usermod -u 1000 www-data

# Cleanup & Entrypoint
RUN apt-get -y clean
ENTRYPOINT ["/config/entrypoint.sh"]
