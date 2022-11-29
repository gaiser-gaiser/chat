FROM golang:1.11.4-alpine3.8 AS envir
RUN apk --no-cache add git gcc musl-dev 
WORKDIR /github.com/gaiser-gaiser
RUN git clone https://github.com/gaiser-gaiser/chat.git
WORKDIR /github.com/gaiser-gaiser/chat
RUN go mod init
RUN go mod tidy
RUN go build -o /chat .
FROM alpine:3.8
COPY --from=envir /chat /chat
ENTRYPOINT ["/chat"]

