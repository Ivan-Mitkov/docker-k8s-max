#https://hub.docker.com/_/composer
FROM composer:latest

WORKDIR /var/www/html

ENTRYPOINT [ "composer","--ignore-platform-reqs" ]