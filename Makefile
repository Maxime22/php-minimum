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

add-phpunit:
	docker compose exec php-minimum composer require --dev phpunit/phpunit
	
create-tests-setup:
	@mkdir -p tests
	@echo '<?xml version="1.0" encoding="UTF-8"?>\n<phpunit bootstrap="vendor/autoload.php" colors="true">\n    <testsuites>\n        <testsuite name="App Test Suite">\n            <directory>./tests</directory>\n        </testsuite>\n    </testsuites>\n</phpunit>' > phpunit.xml
	@echo '<?php\n\nuse PHPUnit\\Framework\\TestCase;\nuse App\\First;\n\nclass FirstTest extends TestCase\n{\n    public function testCoucou()\n    {\n        $$first = new First();\n        $$this->expectOutputString("Coucou, tout fonctionne !");\n        $$first->coucou();\n    }\n}' > tests/FirstTest.php

test:
	docker compose exec php-minimum ./vendor/bin/phpunit