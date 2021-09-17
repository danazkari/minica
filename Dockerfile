FROM golang:1.17

RUN go get github.com/jsha/minica

ENTRYPOINT ["minica"]
