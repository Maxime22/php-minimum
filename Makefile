package:
	tar -zcvf ./test-back.tar.gz `git ls-tree -r master --name-only | sed '/test-back.tar.gz/d'`

build:
	docker build -t monimage .

start:
	docker run -it -d -v ${PWD}:/app --name moncontainer -p 8080:80 monimage

sh:
	docker exec -it moncontainer bash

stop:
	docker rm -f moncontainer

install-linux:
	docker run -ti --rm \
        --env COMPOSER_HOME=/tmp/composer \
        --volume ${HOME}/.config/composer:/tmp/composer \
        --volume ${PWD}:/app \
        --user $(id -u):$(id -g) \
        --workdir /app \
        evaneos/ev-tools:20220421 composer install

install-macos:
	docker run -ti --rm \
        --env COMPOSER_HOME=/tmp/composer \
        --volume ${HOME}/.config/composer:/tmp/composer \
        --volume ${PWD}:/app \
        --workdir /app \
        evaneos/ev-tools:20220421 composer install

cli-linux:
	docker run -ti \
        --user $(id -u):$(id -g) \
        --volume ${PWD}:/app \
        --workdir /app \
        php:5.6-cli bash

cli-macos:
	docker run -ti \
        --volume ${PWD}:/app \
        --workdir /app \
        php:5.6-cli bash

run-tests-linux:
	docker run -ti \
        --user $(id -u):$(id -g) \
        --volume ${PWD}:/app \
        --workdir /app \
        php:5.6-cli ./vendor/bin/phpunit

run-tests-macos:
	docker run -ti \
        --volume ${PWD}:/app \
        --workdir /app \
        php:5.6-cli ./vendor/bin/phpunit
