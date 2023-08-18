# Minimalistic Risc V Kernel

This project was part of Operating Systems 1 and Operating Systems 2 class.<br>
It was real fun to do and I learned a lot about risc-v and OS during the process.

## First Part

__First part of the project__ (OS1, 2022 second semester) was to create basic Kernel functionalities on top of xv6 kernel part of used just to initialize risc-v processor and jump to the main function of the kernel.

Project included ABI, C API and CPP API for system calls for working with __memory__, __threads__, __semaphores__ and __console(IO)__. For all that functionalities to be realized kernel must have many components: __interrupt routines__, __scheduler__, __memory allocator__, __IO thread__ and many structures for representation control blocks etc. 

## Second Part 

__Second part of the project__ (OS2, 2023 first semester) was to update the kernel I made for the OS1 class with new __slab allocator__ for managing the memory, and to introduce __virtualization__ so the Kernel and the userspace could be separated and user program cannot access the kernel space(which was not managed in the first part).

__The tests__ were provided by class assistants and professors.

## About the system:

System is working with __one processor__ so there is only __one thread__ controlling the processor at the time. __Kernel itself isn't preemptive__, but __userspace is__. Kernel is minimalistic so it can run only __single user function__(__userMain__) which represents one program. This function is run upon initialization of the kernel and after all of the user threads are finished the kernel stops.

## Installation, Building and Running (Ubuntu/Debian)

Installing required linux packages:

```
sudo apt install git build-essential qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu gdb-multiarch g++-riscv64-linux-gnu
```

Getting the repository on the local machine:
```
git clone https://github.com/ikac22/Risc-V-Kernel.git
```

Building the code and running the kernel in virtual machine:
```
cd Risc-V-Kernel
make clean
make qemu
``` 

When the __kernel finishes__ or you want __to stop the virtual machine__ just tipe `ctrl-a` and then press `x` (`ctrl-a x`).

## Running the kernel

When kernel is started, first it will print out some initialization text. After that initialization, kernel will run the `userMain` function which can be found in the `src/user/userMain.cpp` file. This function is where userspace starts and where new threads could be created. If you want to create user program just change the __userMain__. 

<!-- 
TODO:

## Interfaces 

__ABI__ and __C API__:

__CPP API__:
!-->