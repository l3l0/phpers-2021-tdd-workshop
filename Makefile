SHELL := /bin/bash
EXEC_COMMAND ?= docker-compose exec application

help: ## show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
up:
	docker-compose up -d
install:
	${EXEC_COMMAND} composer install
build:
	docker-compose build
bash: ## run bash inside application container
	docker-compose exec application bash
start: ## start and install dependencies
start: build up install
phpunit:
	${EXEC_COMMAND} vendor/bin/phpunit
test: ## run all tests
test: phpunit
clear: ## clear after docker
	docker-compose down
