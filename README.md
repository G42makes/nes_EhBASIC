# Enhanced BASIC 6502 with patches, and build/test/customization system

*Important description and conditions from the author of Enhanced BASIC:*

Enhanced BASIC is a BASIC interpreter for the 6502 family microprocessors. It
is constructed to be quick and powerful and easily ported between 6502 systems.
It requires few resources to run and includes instructions to facilitate easy
low level handling of hardware devices. It also retains most of the powerful
high level instructions from similar BASICs.

EhBASIC is free but not copyright free. For non commercial use there is only one
restriction, any derivative work should include, in any binary image distributed,
the string "Derived from EhBASIC" and in any distribution that includes human
readable files a file that includes the above string in a human readable form
e.g. not as a comment in an HTML file.

For commercial use please contact Lee Davison at leeedavison@googlemail.com
for conditions.

*My comment:* the original version on basic.asm can be found as
doc/basic_original.asm

# My modifications, additions (based on others' work too)

This project is derived from EhBASIC. My goal with this repository includes:

* Clean compilation with a modern assembler (ca65 from cc65 suite)
* Conditionally applicable patches can be found on the Net for EhBasic,
  with simple -D statements given to the assembler
* No, or minimal hacking of basic.asm to allow to compile for different
  systems, with different needs
* Exploit the nature of cc65 suite, ie using the linker (ld65) to link
  the "EhBASIC core" with the custom parts
* Simple build with a 'make' command or so
* Easy testing without complicated tasks, 'make test' is enough

My additions to this project can be treated as "public domain", though please
do not forget, that many parts has its own copyrights and conditions, especially
EhBasic! My statement is only true on parts written by me.

# Detailed features, additions, modifications

* Modified basic.asm for clean compilation with ca65, without the need to
  enable "legacy" features (like labels wthout colons)
* Using an own segment definition instead of "ORG" and similar things
* Conditionally applicable patches with -D statements for ca65
  *NOTE*: these patches are not (or mainly not) written by me! Please
  read files doc/mixed_case_keywords_mod.txt and doc/bugsnquirks.txt
  about the origins, greetings to their authors!
* Some things exported/imported at linker level between the "EhBasic core"
  (basic.asm) and "skeleton"
* An example for the latter is provided, more will come
* You can actually try and run EhBasic without much complication with
  including a simplified and modified (by me) version of Mike Naberezny's
  Python based Py65 project from here: https://github.com/mnaberez/py65

*TODO:*

* Add more patches, custom modifications
* Add other examples, not only for the Python test environment, but for real
  computers as well
* Consider the usage of a "full screen editor" as C64 would do, and try to
  interface that with the EhBasic core
* Implement a better console for Py65, with Windows compatilibity too
  (actually Py65 has one, though it was easier for me to start with an ncurses
  based one)

# Instructions

You need a UNIX-like operating system, with make, Python (including the
curses module), and ca65 installed. You need to say 'make' for compilation.
You can also build/try the result with: 'make test'.

pytest.asm is the "skeleton" uses basic.asm "core" for this test, pytest.asm
also functions as an example how to use the "core" (also check Makefile for
-D stuffs).
