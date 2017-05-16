CA65		= ca65
LD65		= ld65
CA65OPTS	= -t none -g
LD65OPTS	=
PATCHDEFS	=
PATCHDEFS	+= -DEHBASIC_PATCH_MIXED_CASE_KEYWORDS
PATCHDEFS	+= -DEHBASIC_PATCH_DISABLE_INVALID_BCD
PATCHDEFS	+= -DEHBASIC_PATCH_DISABLE_ASK_MEMORY_SIZE

all: pytest.bin

pytest.bin: basic.asm pytest.asm pytest.cfg Makefile
	$(CA65) $(CA65OPTS) $(PATCHDEFS) basic.asm
	$(CA65) $(CA65OPTS) pytest.asm
	$(LD65) -Ln pytest.lab -vm -m pytest.map -C pytest.cfg -o pytest.bin basic.o pytest.o

test: pytest.bin
	python py65ehbasic.py pytest.bin 0xD000 0xD000

clean:
	rm -f *.o *.bin *.prg *.d81 *.d64 *.map	*.lab
