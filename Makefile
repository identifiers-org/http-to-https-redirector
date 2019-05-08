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
