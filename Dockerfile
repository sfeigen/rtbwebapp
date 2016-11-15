FROM golang:1.7.1

RUN mkdir /app

ADD gowebapp /app/gowebapp
ADD vendor/controller /app/controller
ADD vendor/model /app/model
ADD vendor/route /app/route
ADD vendor/shared /app/shared

WORKDIR /appRoot

EXPOSE 80

ENTRYPOINT /app/gowebapp