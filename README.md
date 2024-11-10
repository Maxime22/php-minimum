# Context 

This project contains php 8.3, nginx and docker. You can also use a command make to add tests.
It is useful for exercises and katas in PHP.
Consider to create a fork of this repository to use it for each of your playgrounds.

Enjoy !

## How to run?
- ```make build```
- ```make up```
- ```make install``` (create vendor/autoload.php)
- Go to http://127.0.0.1:8080/

## If you want to add tests
- ```make create-tests-setup```
- ```make add-phpunit```
- ```make test```