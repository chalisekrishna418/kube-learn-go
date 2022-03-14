FROM golang:alpine AS build-env
ADD main.go /go/src/app/
WORKDIR /go/src/app
RUN GOOS=linux go build -o app .

FROM scratch
WORKDIR /app
COPY --from=build-env /go/src/app/app .
COPY --from=build-env /go/src/app/config.json .
ENTRYPOINT [ "./app" ]