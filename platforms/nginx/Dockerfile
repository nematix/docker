FROM nematix/ubuntu
MAINTAINER "Azri Jamil" <azri@nematix.com>

# Package dependency & installing nginx
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y nginx

# Reconfigured nginx
RUN rm -rf /etc/nginx/*.d
RUN mkdir -p /etc/nginx/addon.d /etc/nginx/conf.d /etc/nginx/host.d /etc/nginx/nginx.d
RUN useradd -u 500 nginx

# Configurations
RUN mkdir -p /config
ADD config/init01 /config/init01
ADD config/etc /etc

# Ports
EXPOSE 80
EXPOSE 443

# Cleanup & Entrypoint
RUN apt-get -y clean
