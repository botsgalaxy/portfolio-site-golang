FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest

COPY --from=builder /app/app /app/app
COPY --from=builder /app/static/ /app/static/

CMD ["/app/app"]
