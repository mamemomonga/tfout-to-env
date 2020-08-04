# tfout-to-envv

terraform json output convert to env values

# Examples

main.tf

	output output1 {
	  value = "value1"
	}
	
	output output2 {
	  value = {
	    index2a = "value2a"
	    index2b = "value2b"
	    index2c = 203
	  }
	}
	
	output output3 {
	  value = {
	    index3a = {
	      index3a1 = "value3a1"
	      index3a2 = "value3a2"
	      index3a2 = "value3a3"
	    }
	    index3b = {
	      index3b1 = "value3b1"
	      index3b2 = "value3b2"
	      index3b3 = "value3b3"
	    }
	  }
	}
	
	output output4 {
	  value = [
	    "value4a",
	    "value4b",
	    "value4c",
	  ]
	}

data/cofnig.yaml

	- key:    output1
	  prefix: OUT1
	
	- key:    output2
	  prefix: OUT2
	
	- key:    output3.index3b
	  prefix: OUT3B
	
	- key:    output4
	  prefix: OUT4

output terraform

	$ terraform apply
	$ terraform output -json > data/terraform.json

example1(optimized for shell)

	$ docker run --rm -v $(pwd)/data:/data:ro [DOCKER_IMAGE]

result

	OUT1="value1"
	OUT2_INDEX2C="203"
	OUT2_INDEX2A="value2a"
	OUT2_INDEX2B="value2b"
	OUT3B_INDEX3B1="value3b1"
	OUT3B_INDEX3B3="value3b3"
	OUT3B_INDEX3B2="value3b2"
	OUT4_000="value4a"
	OUT4_001="value4b"
	OUT4_002="value4c"

example2(optimized for docker envfile, Makefile)

	$ docker run --rm -v $(pwd)/data:/data:ro [DOCKER_IMAGE] -n

result

	OUT1=value1
	OUT2_INDEX2B=value2b
	OUT2_INDEX2A=value2a
	OUT2_INDEX2C=203
	OUT3B_INDEX3B2=value3b2
	OUT3B_INDEX3B3=value3b3
	OUT3B_INDEX3B1=value3b1
	OUT4_000=value4a
	OUT4_001=value4b
	OUT4_002=value4c

# LISENCE

MIT

