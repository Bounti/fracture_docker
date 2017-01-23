# fracture 

Fracture is an architecture-independent decompiler to LLVM IR. It is open source software. You may freely distributed it under the terms of the 3-clause BSD license agreement found in the LICENSE file. See the INSTALL.md file for instructions on how to compile and install this software. See here : https://github.com/draperlaboratory/fracture

# fracture_docker

Fracture Docker is a Ubuntu 12.10 based Docker image that provides an isolated instance with the latest version of Fracture and LLVM 3.2.

# Installation

`$ docker build -t fracture .`

#Starting Fracture 

Start a docker container with interactive mode (-ti) and shared directory (-v). The container is deleted when exiting (--rm).

`$ docker run -ti --rm -v /opt/fracture:/home/test fracture bash`
