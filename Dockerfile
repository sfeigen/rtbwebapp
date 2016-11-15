FROM golang:1.7.1

RUN mkdir /app

ADD . /app/gowebapp
ADD controller /app/controller
ADD model app/model
ADD route /app/route
ADD shared /app/shared

WORKDIR /app

EXPOSE 80

ENTRYPOINT /app/gowebapp