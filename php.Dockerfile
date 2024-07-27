FROM php:8.2-fpm

ADD docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

WORKDIR /app

RUN apt-get clean && apt-get update && apt-get install -y \
    curl \
    zip \
    git \
    libicu-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql opcache intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD prod
ENTRYPOINT [ "/docker-entrypoint.sh" ]
