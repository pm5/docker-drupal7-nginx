NAME = pomin5/drupal7-nginx
VERSION = 0.1.0
CONTAINER_NAME=`pwd | sed 's/.*\///'`_drupal7-nginx

.PHONY: build test run

build:
	docker build --rm -t $(NAME):$(VERSION) .

test:
	docker run -it --rm \
		-p 8080:80 -p 2222:22 -p 2020:20 -p 2121:21 \
		-e ENABLE_FTP=1 \
		-e ENABLE_MY_KEY=1 \
	 	-v $(PWD):/var/www/sites/all/modules/custom \
	 	-v $(PWD)/.run/log:/var/log \
	 	$(NAME):$(VERSION) /bin/bash

run:
	docker run -dt \
		-p 8080:80 -p 2222:22 -p 2020:20 -p 2121:21 \
		-e ENABLE_FTP=1 \
		-e ENABLE_MY_KEY=1 \
	 	-v $(PWD):/var/www/sites/all/modules/custom \
	 	-v $(PWD)/.run/log:/var/log \
		--name $(CONTAINER_NAME) \
	 	$(NAME):$(VERSION)
