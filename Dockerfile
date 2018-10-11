FROM ubuntu as builder

WORKDIR /src
RUN apt-get update&&apt-get install git yasm build-essential -y
RUN git clone https://github.com/den-vasyliev/asmttpd.git&&cd asmttpd && make

FROM scratch
WORKDIR /html
ADD ./html .
COPY --from=builder /src/asmttpd/asmttpd /
EXPOSE 8080
CMD ["/asmttpd", "/html"]
