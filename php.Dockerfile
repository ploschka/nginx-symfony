FROM php:8.2-fpm

RUN apt-get clean && apt-get update && apt-get install -y \
    libicu-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql opcache intl

USER www-data
WORKDIR /app

