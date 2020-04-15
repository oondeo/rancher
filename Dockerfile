FROM rancher/rancher:${DOCKER_TAG}

RUN mv /usr/bin/rancher-machine /usr/bin/rancher-machine.bin  \
    && mv /usr/bin/jailer.sh /usr/bin/jailer.sh.bin

ADD rancher-machine.sh /usr/bin/rancher-machine
ADD jailer.sh /usr/bin/jailer.sh

#makeself build rancher-machine "Rancher Machine" ./rancher-machine