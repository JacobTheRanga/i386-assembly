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

## Hello World!

**Source:** *src/helloworld.s*

This simple program invokes a system write call
to print out the phrase "Hello World!" to Linux standard output 
along with a new-line character.
Then the system exit call is invoked with an exit status of 0.

## For Loops

**Source:** *src/forloop.s*

This program set up the arguments for a system write call 
and then goes into a loop which increments the second to last
byte in a loop output string - '0'. This byte is then compared to check
if the numerical representation is less or equal to the byte '9'.
If this condition is true then the instruction cursor jumps back to
invoke the standard output system write call and increment the byte. 
Once this jump condition is no longer met, the program finally involves
the exit system call with an exit status of 0.