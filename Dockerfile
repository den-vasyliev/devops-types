FROM ubuntu as builder

WORKDIR /src
RUN apt-get update&&apt-get install git nasm build-essential -y
RUN git clone https://github.com/den-vasyliev/asmhttpd.git&&cd asmhttpd && make

FROM scratch
WORKDIR /html
ADD ./html /html
COPY --from=builder /src/asmhttpd/asmhttpd /
ENTRYPOINT ["/asmhttpd", "/html"]
EXPOSE 8080



