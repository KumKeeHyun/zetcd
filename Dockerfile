FROM golang:1.17.2-alpine as builder

WORKDIR /go/src/github.com/etcd-io/zetcd
COPY . .

RUN go mod download

RUN go build -mod=mod -o /go/src/github.com/etcd-io/zetcd/bin/zetcd /go/src/github.com/etcd-io/zetcd/cmd/zetcd

FROM arm64v8/alpine:3.12

COPY --from=builder /go/src/github.com/etcd-io/zetcd/bin/zetcd /usr/local/bin/zetcd
EXPOSE 2181

CMD ["/usr/local/bin/zetcd", "-zkaddr", "0.0.0.0:2181"]
