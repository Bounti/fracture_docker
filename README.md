# fracture_docker

Fracture Docker is a Ubuntu 12.10 based Docker image that provides an isolated instance with the latest version of Fracture and LLVM 3.2.

# Installation

`$ docker build -t fracture .`

#Starting Fracture 

Start a docker container with interactive mode (-ti) and shared directory (-v). The container is deleted when exiting (--rm).

`docker run -ti --rm -v /opt/fracture:/home/test fracture bash`
