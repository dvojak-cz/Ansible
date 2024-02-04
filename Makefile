.phony: build run

build:
	docker build -t ansible-setup .

run: build
	sudo docker run --cap-add=NET_ADMIN -v $(shell pwd):/home/jan/ansible:ro -it --name as ansible-setup || docker start -i as

debug: build
	sudo docker run --cap-add=NET_ADMIN -v $(shell pwd):/home/jan/ansible:ro -it --rm ansible-setup /bin/bash

clean:
	docker rm -f as

#https://discord.com/api/download?platform=linux&format=deb
