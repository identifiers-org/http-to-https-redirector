# This Makefile helps on building the production container image
# Author: Manuel Bernal Llinares <mbdebian@gmail.com>

# Environment
container_name = identifiersorg/http-to-https-redirector
tag_version = $(shell cat VERSION)

# Default target
all:
	@echo "<===|DEVOPS|===> [WARNING] There is no 'default target'"

release: deploy
	@echo "<===|DEVOPS|===> [RELEASE] New Software Release"

deploy: clean container_production_push
	@echo "<===|DEVOPS|===> [DEPLOY] Deploying service container version ${tag_version}"

container_production_build:
	@echo "<===|DEVOPS|===> [BUILD] Production container $(container_name):$(tag_version)"
	@docker build -t $(container_name):$(tag_version) -t $(container_name):latest .

container_production_push: container_production_build
	@echo "<===|DEVOPS|===> [PUBLISH]> Production container $(container_name):$(tag_version)"
	@docker push $(container_name):$(tag_version)
	@docker push $(container_name):latest

clean:
	@echo "<===|DEVOPS|===> [CLEAN] Cleaning the space"

.PHONY: all clean container_production_build container_production_push deploy release
