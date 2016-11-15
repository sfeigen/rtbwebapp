FROM golang:1.7.1

RUN mkdir /app

ADD . /app/gowebapp

RUN go get github.com/gorilla/context && \
go get github.com/gorilla/sessions && \
go get github.com/go-sql-driver/mysql && \
go get github.com/haisum/recaptcha && \
go get github.com/jmoiron/sqlx && \
go get github.com/josephspurrier/csrfbanana && \
go get github.com/julienschmidt/httprouter && \
go get github.com/justinas/alice && \
go get github.com/mattn/go-sqlite3 && \
go get golang.org/x/crypto/bcrypt

ADD vendor/controller /usr/local/golang/1.7.1/go/src/controller
ADD vendor/model /usr/local/golang/1.7.1/go/src/model
ADD vendor/route /usr/local/golang/1.7.1/go/src/route
ADD vendor/shared /usr/local/golang/1.7.1/go/src/shared

WORKDIR /app

EXPOSE 80

ENTRYPOINT /app/gowebapp