DCR_IMAGE_NAME=terraform-output-to-env

all: apply output

apply:
	terraform apply

output:
	mkdir -p data
	terraform output -json > data/terraform.json
	docker run --rm -v $(CURDIR)/data:/data:ro $(DCR_IMAGE_NAME) 

