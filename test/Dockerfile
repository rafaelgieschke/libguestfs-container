FROM rafaelgieschke/libguestfs-container
WORKDIR /
RUN qemu-img create /test.img -f qcow2 1G
COPY start /
