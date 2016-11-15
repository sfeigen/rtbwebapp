FROM golang:1.7.1

RUN mkdir /app

COPY . /app/gowebapp

WORKDIR /app

EXPOSE 80

ENTRYPOINT /app/gowebapp