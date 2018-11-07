FROM rafaelgieschke/libguestfs-container
WORKDIR /libguestfs
RUN make install REALLY_INSTALL=yes
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y libguestfs-tools
COPY --from=0 /usr/local/ /usr/local/
