FROM nginx:alpine

WORKDIR /app

COPY nginx.conf /etc/nginx/nginx.conf

CMD nginx -g "daemon off;"
