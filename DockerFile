FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 php7.0  \
    libapache2-mod-php curl \
    mysql-server
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

COPY ./gym  /var/www/gym
WORKDIR /var/www/gym
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

CMD /usr/sbin/apache2ctl -D FOREGROUND