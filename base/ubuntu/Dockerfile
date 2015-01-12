FROM phusion/baseimage:latest
MAINTAINER "Azri Jamil" <azri@nematix.com>

ENV HOME /data
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]

# Package dependency
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qqy && apt-get upgrade -y
RUN apt-get install -y inotify-tools supervisor net-tools procps vim
RUN service supervisor restart

# Centralized data path
RUN mkdir -p /data/config
ADD config/entrypoint.sh /data/config/entrypoint.sh
ADD config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /data/config/entrypoint.sh

# Cleanup & Entrypoint
RUN apt-get -y clean
CMD ["/data/config/entrypoint.sh"]
