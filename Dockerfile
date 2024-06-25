# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:php7.4-apache

RUN apt-get update && apt-get install -y magic-wormhole

RUN a2enmod headers

RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

RUN echo '<Directory /var/www/html>\n    Options Indexes FollowSymLinks\n    AllowOverride All\n    Require all granted\n    <IfModule mod_headers.c>\n        Header set Access-Control-Allow-Origin "*"\n        Header set Access-Control-Allow-Methods "GET, POST, OPTIONS"\n        Header set Access-Control-Allow-Headers "Content-Type, Authorization"\n    </IfModule>\n</Directory>' >> /etc/apache2/apache2.conf

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data
