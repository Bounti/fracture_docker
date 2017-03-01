FROM ubuntu:trusty

MAINTAINER Corteggiani Nassim nassim.corteggiani@maximintegrated.com

RUN apt-get update
RUN apt-get install -y --force-yes git libedit-dev build-essential \
autoconf make gcc g++ binutils binutils-dev libc++-dev python groff doxygen nano\
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN cd /home/; git clone https://github.com/llvm-mirror/llvm;
RUN cd /home/llvm; git checkout release_36

RUN cd /home/llvm/tools; git clone https://github.com/llvm-mirror/clang;
RUN cd /home/llvm/tools/clang; git checkout release_36
RUN cd /home/llvm/; ./configure --enable-debug-symbols --prefix=/usr/local --build=x86_64-linux-gnu; make -j8; make install

RUN cd /home/; git clone https://github.com/draperlaboratory/fracture.git fracture
RUN cd /home/fracture; ./autoconf/AutoRegen.sh; ./configure --enable-debug-symbols --with-llvmsrc=/home/llvm --with-llvmobj=/home/llvm --disable-optimized; make -j8

WORKDIR /home/

VOLUME /home/noname/Test:/home/test

RUN useradd -ms /bin/bash fracture
RUN echo "fracture:fracturer" | chpasswd && adduser fracture sudo
RUN chown -R fracture:fracture /home/fracture
USER fracture

CMD ["echo","Home directory $HOME"]
CMD ["echo","Workspace directory $HOME/projects"]
CMD ["echo","Welcome to Avatar Framework !"]


