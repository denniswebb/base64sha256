FROM scratch

COPY build/app /app

ENTRYPOINT ["/app"]
