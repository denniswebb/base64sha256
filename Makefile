GO_VERSION := latest
output_filter := build/{{.OS}}_{{.Arch}}/{{.Dir}}
current_dir := $(shell pwd)
project := $(notdir $(current_dir))
user := $(notdir $(shell dirname $(current_dir)))
container_dir := /go/src/github.com/$(user)/$(project)

all:
	gox -osarch darwin/amd64 -osarch linux/amd64 -output="$(output_filter)"

linux:
	gox -osarch linux/amd64 -output="$(output_filter)"

mac:
	gox -osarch darwin/amd64 -output="$(output_filter)"

clean:
	rm -rf build/
	go clean

build-in-docker: clean
	docker run -ti -v $(current_dir):$(container_dir) golang:$(GO_VERSION) /bin/bash -c "cd $(container_dir) && ./build.sh"

image:
	docker build -t $(project):latest .
