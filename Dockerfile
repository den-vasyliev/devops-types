FROM ubuntu as builder

WORKDIR /src
RUN apt-get update&&apt-get install git nasm build-essential -y
RUN git clone https://github.com/jcalvinowens/asmhttpd.git&&cd asmhttpd && make

FROM scratch
WORKDIR /html
ADD ./html /html
COPY --from=builder /asmhttpd/asmhttpd /
ENTRYPOINT ["/asmhttpd", "/html"]



