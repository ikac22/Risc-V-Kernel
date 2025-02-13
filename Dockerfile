FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y git \
	build-essential \
	qemu-system-misc \
	gcc-riscv64-linux-gnu \
	binutils-riscv64-linux-gnu \
	gdb-multiarch \
	g++-riscv64-linux-gnu

WORKDIR /app

CMD ["/bin/bash", "-c", "make -C /app clean && make -C /app qemu-gdb"] 
