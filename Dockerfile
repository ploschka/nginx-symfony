FROM nginx:stable-alpine

WORKDIR /app

RUN ["apk", "add", "php8"]
RUN ["apk", "add", "php"]
RUN ["apk", "add", "composer"]
RUN ["apk", "add", "php8-curl"]
RUN ["apk", "add", "php8-mbstring"]
RUN ["apk", "add", "php8-tokenizer"]
RUN ["apk", "add", "php8-ctype"]
RUN ["apk", "add", "php8-xml"]
RUN ["apk", "add", "php8-pdo"]
RUN ["apk", "add", "php8-pdo_pgsql"]
RUN ["apk", "add", "php8-pdo_mysql"]
RUN ["apk", "add", "php8-dom"]
RUN ["apk", "add", "php8-xmlwriter"]
RUN ["apk", "add", "php8-session"]
RUN ["apk", "add", "php8-simplexml"]

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["composer", "update", "&&", "composer", "symfony:dump-env", "prod", "&&", "nginx", "-p", "/app/public"]
