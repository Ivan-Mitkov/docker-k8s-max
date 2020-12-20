# need php-fpm image for nginx
# https://hub.docker.com/_/php/
FROM php:7.4-fpm-alpine
# nginx.conf
WORKDIR /var/www/html
RUN docker-php-ext-install pdo pdo_mysql
# no command so it will run the default base image command