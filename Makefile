build:
	docker build -t monimage .

start:
	docker run -it -d -v ${PWD}:/app --name moncontainer -p 8080:80 monimage

sh:
	docker exec -it moncontainer sh

stop:
	docker rm -f moncontainer
