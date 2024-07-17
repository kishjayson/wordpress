# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:php7.4-apache

RUN apt-get update && apt-get install -y magic-wormhole
RUN echo 'skip-log-bin' >> /etc/mysql/my.cnf

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data
