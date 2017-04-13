# debian-docker
Debian docker image with docker utils installed

The purpose of this image is to be able to run docker builds inside a container. 

The image can be run either by using the docker socket or with `--privileged`. As [jpetazzo suggested](http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/), using `--privileged` is not always a good idea and the docker socket should be used.

Docker socket:
```
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock paulwoelfel/debian-docker docker info
```

privileged:
```
docker run --rm --privileged paulwoelfel/debian-docker docker info
```


# Docs

This docker image uses the instructions from [docker.com](https://docs.docker.com/engine/installation/linux/debian/) to install the docker binary. 

