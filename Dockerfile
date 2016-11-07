FROM golang:1.7.1
COPY bin/app /go/bin
EXPOSE 8080
CMD ["/go/bin/app"]