all: pytest.bin

pytest.bin: basic.asm pytest.asm pytest.cfg Makefile
	ca65 -t none -DEHBASIC_PATCH_MIXED_CASE_KEYWORDS basic.asm
	ca65 -t none pytest.asm
	ld65 -C pytest.cfg -o pytest.bin basic.o pytest.o

test: pytest.bin
	python py65ehbasic.py pytest.bin 0xc000 0xc000	

clean:
	rm -f *.o *.bin *.prg *.d81 *.d64	
