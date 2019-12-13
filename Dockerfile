FROM ubuntu as builder

WORKDIR /builder
RUN apt-get update&&apt-get install git nasm build-essential -y
RUN cd src && make

FROM scratch
WORKDIR /html
ADD ./html/frame /html
COPY --from=builder /builder/src/httpd/httpd /
EXPOSE 8080
ENTRYPOINT ["/httpd", "/html"]




