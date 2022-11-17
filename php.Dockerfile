FROM php:8.1-fpm

ADD docker-entrypoint.sh /
ADD nodejs.tar.xz /
ENV PATH="${PATH}:/nodejs/bin/"

WORKDIR /app

RUN apt-get clean && apt-get update && apt-get install -y \
    curl \
    zip \
    git
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN npm install --global yarn

EXPOSE 9000
CMD prod
ENTRYPOINT [ "/docker-entrypoint.sh" ]
