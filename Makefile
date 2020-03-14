.PHONY: test build

build:
	docker build -t cloudbypass .
vendor:
	docker run --rm -ti -v "${PWD}:/app" -w /app cloudbypass ./composer.phar install

test: vendor
	docker run --rm --name cloudbypass -ti -v ${PWD}:/app/ -w /app cloudbypass ./composer.phar phpunit
