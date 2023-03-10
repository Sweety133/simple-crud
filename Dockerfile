# syntax=docker/dockerfile=1

FROM golang:1.19.4-alpine
WORKDIR /simple-crud
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o ./server ./cmd/server && chmod +x ./cmd
RUN echo "simple-crud service started"
CMD ["/simple-crud/server/"]
