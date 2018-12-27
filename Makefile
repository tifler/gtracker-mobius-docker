DOCKER_NAME=gtracker-mobius
DOCKER_VERSION=latest
DOCKER_IMAGE=$(DOCKER_NAME):$(DOCKER_VERSION)
GIT_SERVER ?= new-tako
GIT_REPO=ssh://$(USER)@$(GIT_SERVER)/home/mngr-repo/lap/IOT/gtracker-mobius.git
GIT_PATH=.gtracker-mobius

.PHONY: FORCE

all:	clone remove build

clone:	FORCE
	-git clone $(GIT_REPO) $(GIT_PATH)
	cd $(GIT_PATH) && git pull

remove:	FORCE
	-docker rmi $(DOCKER_IMAGE)

build:	FORCE
	docker build --tag=$(DOCKER_IMAGE) .
