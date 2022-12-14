image:
	$(clean_command)
	docker build -f ./dockerfile -t scylla_node:v1 .

keys:
	$(clean_command)
	mkdir ssh
	ssh-keygen -t rsa -b 4096 -N '' -f ./ssh/id_rsa
	cat ./ssh/id_rsa.pub > ./ssh/authorized_keys