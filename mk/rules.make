#--fomit-frame-pointer important for KC85/3 - don't use IX register
# for compatibility reasons we keep that setting for all libraries
CFLAGS=--std-sdcc11 -Wall --Werror --fomit-frame-pointer

LINK    = sdldz80
AS      = sdasz80
OBJCOPY = sdobjcopy

SDAS_OPT=-plowgff

# SDASZ80 Optionen
# -p   Disable automatic listing pagination
# -l   Create list   file/outfile[.lst]
# -o   Create object file/outfile[.rel]
#      wichtig, ähnlich -c beim GCC
# -w   Wide listing format for symbol table
#      auch im .lst File  
# -g   interne Compiler-Funktionen wie __modsint können sonst nicht mehr gefunden werden
#
# inaktiv:
# -g   Undefined symbols made global 
#      alle externen symbole müssen mittels .globl deklariert werden
#      hilft so Flüchtigkeitsfehler zu vermeiden
# -s   Create symbol file/outfile[.sym]

SDLD_OPT=-mwxiu
# SDLDZ80 Optionen
#Map format:
# -m   Map output generated as (out)file[.map]
# -w   Wide listing format for map file
# -x   Hexadecimal (default)
#Output:
# -i   Intel Hex as (out)file[.ihx]
#List:
# -u   Update listing file(s) with link data as file(s)[.rst]
#      sehr hilfreich!

ifndef Z1013_CODE
Z1013_CODE=0x100
endif

ifndef Z1013_HEADER
Z1013_HEADER=0x00e0
endif

ifdef Z1013_DATA
	Z1013_DATA_OPTION=-b _DATA=$(Z1013_DATA)
endif

all: $(addprefix obj/,$(PLATFORM)) $(addsuffix /bin,$(addprefix obj/,$(PLATFORM)))

obj:
	mkdir obj

obj/gcc:
	mkdir -p "$@"

obj/gcc/bin: obj/gcc/$(OUT)
	
obj/gcc/$(OUT): $(addsuffix .o,$(addprefix obj/gcc/,$(OBJECTS)))
	gcc -g -o "$@" $^ ../lib/gcc-x11/gcc-conio-x11.a -L /usr/X11/lib -lX11 -lpthread -lm 

obj/gcc/%.o : src/%.c
	gcc -g -Wall -pedantic -std=c99 -Werror -Iinclude -I../include-gcc -c -o "$@" $^

include ../mk/rules.a5105.make 

################
#
#  SCP
#
################
.PRECIOUS: obj/scp/%.asm 

obj/scp:
	mkdir -p "$@"

obj/scp/bin: obj/scp/$(OUT).com obj/scp/$(OUT).z80

obj/scp/$(OUT).com: ../lib/scp/crt0.rel $(addsuffix .rel,$(addprefix obj/scp/,$(OBJECTS) $(SDCC_OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _CODE=0x0100 $(LD_FLAGS) -i "obj/scp/$(OUT).ihx" -k ../lib/scp -k ../lib/ -l scp -l z80_ix $^
	$(OBJCOPY) -Iihex -Obinary "obj/scp/$(OUT).ihx" "$@"
	@if [ "OFF" != "$(OPTION_SHOW_HEXDUMP)" ]; then hexdump -C "$@"; fi

obj/scp/$(OUT).z80: ../lib/scp/crt0.rel ../lib/z1013/header.rel $(addsuffix .rel,$(addprefix obj/scp/,$(OBJECTS) $(SDCC_OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _HEADER=$(Z1013_HEADER) -b _CODE=0x0100 $(LD_FLAGS) -i "obj/scp/$(OUT).ihx" -k ../lib/scp -k ../lib/ -l scp -l z80_ix $^
	$(OBJCOPY) -Iihex -Obinary "obj/scp/$(OUT).ihx" "$@"
	dd if="$@" of=padded.z80 bs=32 conv=sync
	mv padded.z80 "$@"
	printf %s $(OUT) | dd bs=1 of="$@" seek=16 conv=notrunc
	@if [ "OFF" != "$(OPTION_SHOW_HEXDUMP)" ]; then hexdump -C "$@"; fi
	
obj/scp/%.asm : src/%.c
	sdcc -mz80 -S -o "$@" --nostdlib  --nostdinc -Iinclude -I../include $(CFLAGS) -D__SCP__ "$<"

obj/scp/%.rel : obj/scp/%.asm
	$(AS) $(SDAS_OPT) -Iinclude "$@" "$<"

################
#
#  Z1013
#
################
.PRECIOUS: obj/z1013/%.asm 

obj/z1013:
	mkdir -p "$@"

obj/z1013/bin: obj/z1013/$(OUT).z80

obj/z1013/$(OUT).z80: ../lib/z1013/crt0.rel ../lib/z1013/header.rel  $(addsuffix .rel,$(addprefix obj/z1013/,$(OBJECTS) $(SDCC_OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _HEADER=$(Z1013_HEADER) $(Z1013_DATA_OPTION) -b _CODE=$(Z1013_CODE)  $(LD_FLAGS) -i "obj/z1013/$(OUT).ihx" -k ../lib/z1013 -k ../lib/ -l z1013 -l krt -l conio -l z80_ix $^
	$(OBJCOPY) -Iihex -Obinary "obj/z1013/$(OUT).ihx" "$@"
	dd if="$@" of=padded.z80 bs=32 conv=sync
	mv padded.z80 "$@"
	printf %s $(OUT) | dd bs=1 of="$@" seek=16 conv=notrunc
	@if [ "OFF" != "$(OPTION_SHOW_HEXDUMP)" ]; then hexdump -C "$@"; fi
	
obj/z1013/%.asm : src/%.c
	sdcc -mz80 -S -o "$@" --nostdlib  --nostdinc -Iinclude -I../include $(CFLAGS) -D__Z1013__ "$<"
	
obj/z1013/%.rel : src/%.s
	$(AS) -plosgff -Iinclude "$@" "$<"

obj/z1013/%.rel : obj/z1013/%.asm
  ifdef ENABLED_BANKED
	pwd
	../tools/bank_replace.pl "$<"
  endif
	$(AS) -plosgff -Iinclude "$@" "$<"
	
################
#
#  Z9001
#
################
.PRECIOUS: obj/z9001/%.asm

obj/z9001:
	mkdir -p "$@"

obj/z9001/bin: obj/z9001/$(OUT).kcc

obj/z9001/$(OUT).kcc: ../lib/z9001/crt0.rel ../lib/z9001/header.rel  $(addsuffix .rel,$(addprefix obj/z9001/,$(OBJECTS)  $(SDCC_OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _KCC_HEADER=0x280 -b _CODE=0x300 $(LD_FLAGS) -i "obj/z9001/$(OUT).ihx" -k ../lib/z9001 -k ../lib/ -l z9001 -l conio -l krt -l z80_ix $^
	$(OBJCOPY) -Iihex -Obinary "obj/z9001/$(OUT).ihx" "$@"
	printf "%.8s" $(OUT) >obj/z9001/filename.txt
	dd bs=1 if=obj/z9001/filename.txt of="$@" count=8 seek=0 conv=notrunc,ucase
	dd bs=1 if=obj/z9001/filename.txt of="$@" count=8 seek=131 conv=notrunc,ucase
	dd if="$@" of=padded.z80 bs=128 conv=sync
	mv padded.z80 "$@"
	@if [ "OFF" != "$(OPTION_SHOW_HEXDUMP)" ]; then hexdump -C "$@"; fi
    
obj/z9001/%.asm : src/%.c
	sdcc -mz80 -S -o "$@" --nostdlib  --nostdinc -Iinclude -I../include $(CFLAGS) -D__Z9001__ "$<"

obj/z9001/%.rel : src/%.s
  ifdef ENABLED_BANKED
	../tools/bank_replace.pl "$<"
  endif
	$(AS) -plosgff -Iinclude "$@" "$<"

obj/z9001/%.rel : obj/z9001/%.asm
  ifdef ENABLED_BANKED
	../tools/bank_replace.pl "$<"
  endif
	$(AS) -plosgff -Iinclude "$@" "$<"
	
	
################
#
#  KC85/2
#
################
.PRECIOUS: obj/kc85/%.asm

obj/kc85:
	mkdir -p "$@"

obj/kc85/bin: obj/kc85/$(OUT).kcc

obj/kc85/$(OUT).kcc: ../lib/kc85/crt0.rel ../lib/kc85/header.rel  $(addsuffix .rel,$(addprefix obj/kc85/,$(OBJECTS) $(SDCC_OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _KCC_HEADER=0x180 -b _CODE=0x200 $(LD_FLAGS) -i "obj/kc85/$(OUT).ihx" -k ../lib/kc85 -k ../lib/ -l kc85 -l caos -l conio -l screen -l krt -l z80_noix $^
	$(OBJCOPY) -Iihex -Obinary "obj/kc85/$(OUT).ihx" "$@"
	printf "%.8s" $(OUT) >obj/kc85/filename.txt
	printf "\x7f\x7f%.8s\x1" $(OUT) >obj/kc85/prolog.txt
	dd bs=1 if=obj/kc85/filename.txt of="$@" count=8 seek=0 conv=notrunc,ucase
	dd bs=1 if=obj/kc85/prolog.txt of="$@" count=11 seek=131 conv=notrunc,ucase
	dd if="$@" of=padded.z80 bs=128 conv=sync
	mv padded.z80 "$@"
	@if [ "OFF" != "$(OPTION_SHOW_HEXDUMP)" ]; then hexdump -C "$@"; fi

obj/kc85/%.asm : src/%.c
	sdcc -mz80 $(CFLAGS) -S -o "$@" --nostdlib  --nostdinc -Iinclude -I../include -D__KC85__ "$<"
#	sdcc -mz80 $(CFLAGS) --reserve-regs-iy -S -o "$@" --nostdlib  --nostdinc -Iinclude -I../include "$<"
#	../tools/ix_replace.sh "$@"

obj/kc85/%.rel : src/%.s
  ifdef ENABLED_BANKED
	../tools/bank_replace.pl "$<"
  endif
	$(AS) -plosgff -Iinclude "$@" "$<"

obj/kc85/%.rel : obj/kc85/%.asm
  ifdef ENABLED_BANKED
	../tools/bank_replace.pl "$<"
  endif
	$(AS) -plosgff -Iinclude "$@" "$<"

run.gcc:
	@echo "******************************************************"
	@echo "*" 
	@echo "* starting application: obj/gcc/$(OUT)"
	@echo "*" 
	@echo "******************************************************"
	obj/gcc/$(OUT) &

run.z1013:
	@echo "******************************************************"
	@echo "*" 
	@echo "* starting application: jkcemu Z1013 obj/z1013/$(OUT).z80"
	@echo "*" 
	@echo "******************************************************"
	jkcemu Z1013 obj/z1013/$(OUT).z80 &

run.kc85:
	@echo "******************************************************"
	@echo "*" 
	@echo "* starting application: jkcemu KC85 obj/kc85/$(OUT).kcc"
	@echo "*" 
	@echo "******************************************************"
	jkcemu KC85 obj/kc85/$(OUT).kcc &

run.z9001:
	@echo "******************************************************"
	@echo "*" 
	@echo "* starting application: jkcemu Z9001 obj/z9001/$(OUT).kcc"
	@echo "*" 
	@echo "******************************************************"
	jkcemu Z9001 obj/z9001/$(OUT).kcc &

run: 
	for name in $(PLATFORM); do make run.$$name; done

.SILENT: stop
.IGNORE: stop

stop:
	pgrep -f 'jkcemu.*obj/' | xargs kill
	pgrep -f 'obj/gcc/$(OUT)' | xargs kill

clean:
	rm -f Makefile~
	rm -f a.out
	rm -f *.bak
	rm -rf obj
	rm -f src/*~
	rm -f src/*.bak
