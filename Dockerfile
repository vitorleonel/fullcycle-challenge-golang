# Builder
FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY main.go .

RUN go mod init
RUN go build

# Runner
FROM scratch

WORKDIR /home

COPY --from=builder /go/src/app/app .

ENTRYPOINT ["./app"]