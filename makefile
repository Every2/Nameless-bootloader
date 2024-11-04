PROGRAM = os.bin

SRC			= os.asm

all: ${PROGRAM}

${PROGRAM}: ${SRC} 
	nasm -fbin ${SRC} -o ${PROGRAM}

clean:
	rm -f ${PROGRAM}

.PHONY: clean, .force-rebuild, all
