# Builder.
FROM golang:1.11.4-alpine3.8 as builder
WORKDIR "/app"
COPY [".", "."]
# @todo: Do we need go mod download?
RUN go build -a -o movie_manager .


# Main.
## @todo: Test if it builds.
## @todo: Switch to alpine?
## @todo: Use unpriviliged user.
## @todo: Add "expose"
FROM scratch
WORKDIR "/app"
COPY --from=builder ["/app/build/movie_manager", "."]
CMD ["./movie_manager"]
