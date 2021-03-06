CA65		= ca65
LD65		= ld65
PYTHON	= python3
CA65OPTS	= -t none -g
LD65OPTS	=
PATCHDEFS	=
PATCHDEFS	+= -DEHBASIC_PATCH_MIXED_CASE_KEYWORDS
PATCHDEFS	+= -DEHBASIC_PATCH_DISABLE_INVALID_BCD
PATCHDEFS	+= -DEHBASIC_PATCH_DISABLE_ASK_MEMORY_SIZE

all: ehbasic.nes

ehbasic.nes: basic.a65 nes.a65
	$(CA65) $(CA65OPTS) $(PATCHDEFS) basic.a65
	$(CA65) $(CA65OPTS) nes.a65
	$(LD65) $(LD65OPTS) -C nes.cfg -Ln basic.labels.txt -o basic.nes nes.o basic.o
	$(PYTHON) fceux_debug_symbols.py


clean:
	rm -f *.o *.bin *.prg *.d81 *.d64 *.map	*.lab *.nes *.nl *.labels.txt *.deb
