NAME=python2
REGISTRY=881028211317.dkr.ecr.eu-west-1.amazonaws.com
BASE_IMAGE=python:2
TAG=$(REGISTRY)/$(NAME)

help:
	$(info Options available:)
	$(info   make dockerfile)
	$(info   make build)
	$(info   make push)

dockerfile:
	sed \
  -e "s#{{ *BASE_IMAGE *}}#$(BASE_IMAGE)#g" \
  Dockerfile.tpl > Dockerfile

build: dockerfile
	docker pull $(BASE_IMAGE)
	docker build --no-cache=true -t $(TAG) .

push:
	docker push $(TAG)
