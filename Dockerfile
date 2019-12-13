FROM denvasyliev/k8sdiy:asmbuilder-v0.0.1 as builder
WORKDIR src
COPY src . 
RUN cd ./httpd-asm && make

FROM scratch
WORKDIR /html
COPY html .
COPY --from=builder /builder/src/httpd-asm/build/httpd .
EXPOSE 15000
ENTRYPOINT ["/httpd"]