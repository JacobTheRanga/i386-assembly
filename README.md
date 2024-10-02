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

## Primitive Function

This program is very special and different from the rest.
There are macros and specific instructions in the x86 instruction set
that perform the same function as a combination of multiple other basic instructions.
Some of these instructions include pop, push, call, ret, etc.
The goal of this program is to simply be able to save the current state of the program,
call a function, create and use local function variables and states,
then restore the previous program state and variables, and finally
return to the instruction after the call. But, all of this must be done
only using basic arithmatic, move, and jump instructions.

None of this is practical or should ever be done for several reasons.
Some of which being that these higher level instructions already exist
and are much simpler to understand, use, and take up less memory, but most importantly
these type of higher level instructions often do not map directly
to the lower level instructions but instead use their own hardware
level optimisations to perform that specific function faster than
the sum of the lower level instructions.

I can not believe that I am saying this but these higher level instructions
are quite abstracted from their lower level counterparts.
So I wanted to create a simple program to better understand how these
higher level instructions actually work under the hood.

I would highly recommend doing this if you have not already
as this is by far (in my opinion) the best way to understand the
underlying program structure of any program. 
You will come out of the other side with a much better understanding
of the actual physical space that you program occupies
(technically virtual space but the program thinks it is physical
space, I will not elaborate it would take me a lifetime)
and doing this will pretty much force you to have a very strong
understanding with pointers.


## Arguments Using the Stack

This program passes arguments to functions
through the means of pushing the arguments onto the stack
before the function call. And then restoring the stack
after the function returns.