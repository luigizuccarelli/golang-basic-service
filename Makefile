.PHONY: all test build clean

all: clean test build

build: 
	go build -o build ./...

test:
	go test -v -coverprofile=tests/results/cover.out ./...

cover:
	go tool cover -html=tests/results/cover.out -o tests/results/cover.html

clean:
	rm -rf build/*
	go clean ./...

container:
	podman build -t  tfld-docker-prd-local.repo.14west.io/golang-simple-oc4service:1.14.2 .

push:
	podman push tfld-docker-prd-local.repo.14west.io/golang-simple-oc4service:1.14.2 
