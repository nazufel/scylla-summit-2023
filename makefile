image:
	$(clean_command)
	docker build -f ./dockerfile -t scylla_node:v1 .

keys:
	$(clean_command)
	mkdir authorized_keys
	ssh-keygen -t rsa -b 4096 -N '' -f ./authorized_keys/id_rsa