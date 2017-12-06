#!/usr/bin/env bash

set -ex

go get -t -d -v ./...
go test -v -race ./...
mkdir -p build/
CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o build/base64sha256
