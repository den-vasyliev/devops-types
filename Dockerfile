FROM ubuntu as builder

WORKDIR /src
RUN apt-get update&&apt-get install git yasm build-essential -y
RUN git clone https://github.com/nemasu/asmttpd.git&&cd asmttpd && make

FROM scratch
ADD ./html/ /
COPY --from=builder /src/asmttpd/asmttpd /
EXPOSE 80
CMD ["/asmttpd", "/html"]