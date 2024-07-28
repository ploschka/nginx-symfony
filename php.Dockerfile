FROM php:8.2-fpm

WORKDIR /app

RUN apt-get clean && apt-get update && apt-get install -y \
    curl \
    zip \
    git \
    libicu-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql opcache intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD configure.sh /
ADD start.sh /

RUN ["chmod", "+x", "/configure.sh"]
RUN ["chmod", "+x", "/start.sh"]

CMD ["/start.sh"]

