# dockerfile

# dockerfiles are used to build docker images - https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

# start with the base image of Ubuntu 20.04 - https://hub.docker.com/_/ubuntu
FROM scylladb/scylla:4.6.0

# ensure that required directories are created to run the container
RUN rm -rf /var/run/sshd && mkdir /var/run/sshd

# remove the ansible key from a previous run in case of caching
RUN rm -rf /root/.ssh/id_rsa

# create an ssh key and place the public key in the authorized_keys 
# (https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)
# for all containers so that the controller container defined in the
# docker-compose.yaml file will be able to ssh into the other conatiners
# and run ansible since it uses ssh to communicate with servers it 
# orchestrates
RUN ssh-keygen -f /root/.ssh/id_rsa
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

# install required packages to run demo
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    openssh-server python3 python3-pip python3-apt \
    && rm -rf /var/lib/apt/lists/*

# install ansible
RUN pip3 install ansible

# add pip3-installed ansible to $PATH
ENV PATH=/usr/local/bin:/usr/local/lib/python3.8/dist-packages:/opt/scylladb/python3/bin:/usr/bin:/usr/sbin

EXPOSE 22