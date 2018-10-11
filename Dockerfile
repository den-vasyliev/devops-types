FROM ubuntu as builder

WORKDIR /src
RUN apt-get update&&apt-get install git hasm build-essential -y
RUN git clone https://github.com/jcalvinowens/asmhttpd.git&&cd asmhttpd && make

FROM bitnami/nginx:latest
#WORKDIR /html
ADD ./html  /opt/bitnami/nginx/html/
COPY --from=builder /src/asmhttpd/asmhttpd /
ENTRYPOINT ["/asmhttpd", "/opt/bitnami/nginx/html/"]
EXPOSE 80



