ARG DOCKER_TAG
FROM golang AS build-env
# RUN apt-get install gcc git mercurial
ADD . /src
RUN cd /src && go build rancher-machine.go


FROM rancher/rancher:${DOCKER_TAG}

RUN mv /usr/bin/rancher-machine /usr/bin/rancher-machine.bin  \
    && mv /usr/bin/jailer.sh /usr/bin/jailer.sh.bin

COPY --from=build-env /src/rancher-machine /usr/bin/
# ADD rancher-machine.sh /usr/bin/rancher-machine
ADD jailer.sh /usr/bin/jailer.sh
