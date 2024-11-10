build:
	docker compose build

up:
	docker compose up -d

install:
	docker compose exec php-minimum composer install

sh:
	docker compose exec php-minimum sh

down:
	docker compose down
