FROM golang:1.8-alpine as builder

COPY src/ /build/

WORKDIR /build

RUN go build -o main main.go

FROM scratch

COPY --from=builder /build/main /app/

WORKDIR /app

CMD ["./main"]

