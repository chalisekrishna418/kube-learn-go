FROM golang:alpine AS build-env
WORKDIR /go/src/app
ADD . .
RUN GOOS=linux go build -o app .
ENTRYPOINT [ "./app" ]