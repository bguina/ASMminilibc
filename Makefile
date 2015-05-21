OUT=	libasm.so
ASM=	nasm
CC=	gcc
LD=	ld
RM=	rm -f

ASMS=strlen.S\
    strchr.S\
	memset.S\
	memcpy.S\
	strcmp.S\
	memmove.S\
	strncmp.S\
	strcasecmp.S\
	rindex.S\
	strstr.S\
	strpbrk.S\
	strcspn.S

OBJECTS=$(ASMS:.S=.o)

CFLAGS=	-g -f elf64
LDFLAGS=	-shared

all: $(OUT)

$(OUT): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $(OUT)

test:
	$(CC) -fno-builtin test.c -L. -lasm -o out_test
	LD_PRELOAD=$(shell pwd)/$(OUT) LD_LIBRARY_PATH=. ./out_test

clean:
	$(RM) $(OBJECTS)

fclean: clean
	$(RM) $(OUT)

re: clean fclean all

%.o: %.S
	$(ASM) $(CFLAGS) $< -o $@ && strip -x $@

