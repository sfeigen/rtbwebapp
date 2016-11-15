FROM golang:1.7.1

RUN mkdir /appRoot

ADD . /appRoot
ADD src/app /appRoot/src/app
ADD src/app/controller /appRoot/src/app/controller
ADD src/app/model /appRoot/src/app/model
ADD src/app/route /appRoot/src/app/route
ADD src/app/shared /appRoot/src/app/shared

WORKDIR /appRoot

EXPOSE 80

ENTRYPOINT /appRoot/src/app