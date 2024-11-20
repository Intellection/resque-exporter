SHELL := /bin/bash

BIN_DIR := ./bin
TAG_VERSION := $(tag)

LDFLAGS := \
-X main.tagVersion=$(TAG_VERSION)

all: dependencies build

dependencies:
	go mod vendor

build:
	@mkdir -p ${BIN_DIR}
	go build -ldflags="$(LDFLAGS)" -o ${BIN_DIR}
	@echo
	@${BIN_DIR}/resque-exporter -version

clean:
	rm -rf ${BIN_DIR}
