FROM bitnami/nginx:latest

COPY ./html ./usr/share/nginx/html

EXPOSE 80
