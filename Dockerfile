FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN sed -Ei 's/^# (deb-src)/\1/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get --assume-yes install build-essential 
RUN apt-get --assume-yes install autoconf
RUN apt-get --assume-yes install git
RUN apt-get --assume-yes build-dep libguestfs  
RUN apt-get --assume-yes install flex
RUN apt-get --assume-yes install bison
RUN apt-get --assume-yes install libjansson-dev
RUN apt-get --assume-yes install libhivex-ocaml-dev
RUN apt-get --assume-yes install linux-image-generic
RUN apt-get --assume-yes install supermin
COPY libguestfs /libguestfs
WORKDIR /libguestfs
RUN ./bootstrap
RUN ./autogen.sh
RUN make; rm po-docs/podfiles; make -C po-docs update-po
RUN make
