DCR_IMAGE_NAME=terraform-output-to-env

test: build
	cd test && make

build:
	docker build -t $(DCR_IMAGE_NAME) .


