SHELL := /bin/bash

BIN_DIR := ./bin
TAG_VERSION := $(tag)

LDFLAGS := \
-X main.tagVersion=$(TAG_VERSION)

build:
	@mkdir -p ${BIN_DIR}
	go build -ldflags="$(LDFLAGS)" -o ${BIN_DIR}
	@echo
	@${BIN_DIR}/resque-exporter -version

