# i386-assembly

An assortment of programs written in 32-bit x86 assembly in intel syntax
using the Netwide Assembler (NASM) and the linker GNU ld.

## Usage *IMPORTANT*

I have created a Makefile that builds every source file
into their own separate binary that by default will be output in a new *./bin* directory
in the same relative path as the source file directory.
The prerequisites needed to build these binaries are
the Netwide Assembler (NASM) and the linker GNU ld.
As long as these are installed, everything should be able to build correctly
as I have specified the option flags needed to force the object files
to be assembled into and linked as 32-bit Executable Linkable Format (elf32).

*These binaries will only work with the Linux kernel as they use the
Linux kernel APIs to perform the needed system calls.