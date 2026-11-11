FROM golang:1.24
WORKDIR /usr/src/app
COPY . .
RUN go build -o server
ENV REQUEST_ORIGIN=http://localhost:5001
ENV PORT=8080
EXPOSE 8080
CMD ["./server"]
