FROM ubuntu as builder

WORKDIR /src
RUN apt-get update&&apt-get install git yasm build-essential -y
RUN git clone https://github.com/den-vasyliev/asmttpd.git&&cd asmttpd && make

FROM bitnami/nginx:latest
#WORKDIR /html
ADD ./html  /opt/bitnami/nginx/html/
# COPY --from=builder /src/asmttpd/asmttpd /
# ENTRYPOINT ["/asmttpd", "/html"]
EXPOSE 80



