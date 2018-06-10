FROM golang:1.10-stretch as build
RUN /usr/local/go/bin/go get github.com/pressly/goose/cmd/goose

FROM debian:stretch-slim
COPY --from=build /go/bin/goose /usr/local/bin/goose
ENTRYPOINT /usr/local/bin/goose
VOLUME /migrations
WORKDIR /migrations
