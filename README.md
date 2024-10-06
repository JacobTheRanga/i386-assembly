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

**Source:** *src/primitiveFunction.s*

This program is very special and different from the rest.
There are macros and specific instructions in the x86 instruction set
that perform the same function as a combination of multiple other basic instructions.
Some of these instructions include pop, push, call, ret, etc.
The goal of this program is to simply be able to save the current state of the program,
call a function, create and use local function variables and states,
then restore the previous program state and variables, and finally
return to the instruction after the call. But, all of this must be done
only using basic arithmetic, move, and jump instructions.

None of this is practical or should ever be done for several reasons.
Some of which being that these higher level instructions already exist
and are much simpler to understand, use, and take up less memory, but most importantly
these type of higher level instructions often do not map directly
to the lower level instructions but instead use their own hardware
level optimisations to perform that specific function faster than
the sum of the lower level instructions.

I can not believe that I am saying this, but these higher level instructions
are quite abstracted from their lower level counterparts.
So I wanted to create a simple program to better understand how these
higher level instructions actually work under the hood.

I would highly recommend doing this if you have not already
as this is by far (in my opinion) the best way to understand the
underlying program structure of any program. 
You will come out of the other side with a much better understanding
of the actual physical space that you program occupies
(technically virtual space, but the program thinks it is physical
space, I will not elaborate it would take me a lifetime)
and doing this will pretty much force you to have a very strong
understanding with pointers.

## Arguments Using the Stack

**Source:** *src/arguments-stack.s*

In the early days of x86, it was common to push your arguments
to the stack. This was due to the limited number of registers
available to the programmer to store these arguments.
So instead storing them in registers, it was common to push
them to the stack, and then copy their values into registers
only when needed. Nowadays, we have enough registers to not have
to worry about this factor. Although this technique can still be
found and can be useful in certain contexts.

This program passes arguments to functions
through the means of pushing the arguments onto the stack
before the function call. And then restoring the stack
after the function returns.

## Arguments Using Registers

**Source:** *src/arguments-registers.s*

Another popular method of passing arguments to functions
is by storing them in registers before calling the function.
This method has several benefits but still is not perfect.
The caller's stack frame does not change at all due
to the arguments just being stored in the registers.
The access time of these arguments is incredibly fast due to using registers over the stack.
The function can perform operations directly on arguments
that are already stored in these registers.
Although again one of the major drawbacks is amount of usable registers,
but this is often solved by programmers pushing any arguments that
can not fit in all the usable registers onto the stack.
So as is usually the case, it is often advantageous
to use a combination of several methods and techniques.

This program passes arguments to functions
through the means of moving these arguments into registers
before the function call. Since the caller of the function 
does not append to the stack at all using this method,
they do not have to worry about restoring the stack
after the call as the caller's stack frame would not have changed.