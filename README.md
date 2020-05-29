# Enhanced BASIC 6502 with patches built for the NES and emulators

The goal here is to build a NES ROM image that can run BASIC. Interestingly, 
there are no real good keyboards for the NES, so I will work on resolving that
problem as well.

## Keyboard
Goals:
 - Emulated: create a Lua script in FCEUX that can take keyboard input and update a proper memory location
 - Hardware: create a small device that can use a USB or PS/2 keyboard in the controller port

## Notes on sources
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

Branched from https://github.com/lgblgblgb/6502_EhBASIC_V2.22