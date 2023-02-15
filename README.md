# Scylla Summit 2023 Talk

This repository holds the demo code for the talk "Maximum Cluster Uptime with Ansible." 

## Getting Started

### Requirements 

* [Docker](https://www.docker.com/)
* [Docker Compose V2](https://docs.docker.com/compose/compose-file/)
* [go-task](https://taskfile.dev/installation/)
* [teleporttacos](https://github.com/nazufel/teleporttacos)
### Starting the Demo

This demo relies on some custom-built Docker images. The first ones are for the demo app itself. Go to the link provided above for teleporttacos and clone the repo. From there follow the directions to build the included Docker images. This is the demo app that's dependent upon Scylla to run while the demo is taking place. Once done, then build the custom image for the Scylla Cluster.

```sh
task build
```

This will build the included [dockerfile](./dockerfile) with the custom Scylla image. The image is pulling Scylla, but the reason to build a custom image rather than use what's provided by the project is for ssh keys to to install Ansible. Of course, this is not a production best practice. Don't bake ssh keys into images or use Ansible to configure containers. This is a demo.

Next, stand up the services.

```sh
task up
```

This will stand up the containers. The `server` container may need to be restarted if it comes up before the Scylla cluster is ready.

Next, exec into the `controller` container. This is where Ansible is ran from and the [docker-compose](./docker-compose.yaml) mounts this local directory into the contianer at `/root/ansible` so that these playbooks are available inside of the container.

```yaml
    volumes:
        - "./:/root/ansible"

```

Exec into the container using the task target 

```sh
task exec
``` 

Change to the above directory to run Ansible

```sh
cd /root/ansible
```

From here, run the playbook `ansible-playbook -i inventories/production update_scylla_config_playbook.yaml`

Great! Well done. You have ran the demo.

### Clean Up

Clean up also has a task target.

```sh
task down
```

This will tear down the containers. Thanks for going through this demo.