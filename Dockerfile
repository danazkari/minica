FROM golang:1.17

RUN go get github.com/jsha/minica

RUN mkdir -p /certs

WORKDIR /certs

ENTRYPOINT ["minica"]
