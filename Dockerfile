FROM golang:1.7.1

# grab dependencies (is there a better way to do this?)
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
COPY bin/app /go/bin
EXPOSE 8080
CMD ["/go/bin/app"]