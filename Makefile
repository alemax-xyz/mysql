override TARGETS = 8.4 9.7

TAG ?= clover/mysql
PLATFORM ?= linux/amd64

all: ${TARGETS} latest

.PHONY: all ${TARGETS} latest

${TARGETS}:
	docker buildx build --progress plain --platform ${PLATFORM} -t ${TAG}:$@ $@ --push

latest:
	docker buildx build --progress plain --platform ${PLATFORM} -t ${TAG}:$@ $^ --push

latest: 8.4
