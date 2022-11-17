FROM nginx:alpine

WORKDIR /app

COPY nginx.conf /etc/nginx/nginx.conf
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

CMD nginx -g "daemon off;"
