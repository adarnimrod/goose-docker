FROM golang:1.10-alpine3.7 as build
RUN apk add --no-cache --update git build-base
RUN /usr/local/go/bin/go get github.com/pressly/goose/cmd/goose

FROM alpine:3.7
COPY --from=build /go/bin/goose /usr/local/bin/goose
ENTRYPOINT /usr/local/bin/goose
VOLUME /migrations
WORKDIR /migrations
