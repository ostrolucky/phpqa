default: build

build: build-latest build-alpine
.PHONY: build

build-latest:
	docker build -t jakzal/phpqa:latest .
.PHONY: build-latest

build-alpine:
	docker build -f Dockerfile-alpine -t jakzal/phpqa:alpine .
.PHONY: build-alpine


NIGHTLY_TAG := gadelat/phpqa:nightly-$(shell date +%y%m%d)
build-nightly:
	echo $(NIGHTLY_TAG)
	docker build -t $(NIGHTLY_TAG) .
	@docker login -u gadelat -p ${DOCKERHUB_PASSWORD}
	docker push $(NIGHTLY_TAG)
