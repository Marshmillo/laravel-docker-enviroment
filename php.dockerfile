FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

RUN apk add libzip-dev

RUN apk add --update --no-cache libintl icu icu-dev libxml2-dev \
    && docker-php-ext-install intl zip soap

RUN apk add --update --no-cache \
        freetype-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" gd

RUN docker-php-ext-install pdo pdo_mysql
