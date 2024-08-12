COLLEEN_ASM = ASM/Colleen.s
GRACE_ASM = ASM/Grace.s
SULLY_ASM = ASM/Sully.s

COLLEEN_C = C/Colleen.c
GRACE_C = C/Grace.c
SULLY_C = C/Sully.c

OBJ_ASM = ASM/Colleen.o ASM/Grace.o ASM/Sully.o
OBJ_C = C/Colleen.o C/Grace.o C/Sully.o

CC = clang
FLAGS = -Wall -Wextra -Werror

NASM = nasm -felf64  
LINKER = ld
LIBC = -e _start -lc -I /lib64/ld-linux-x86-64.so.2

all: colleen grace sully

colleen: ASM/Colleen ASM/Colleen.o C/Colleen

ASM/Colleen: ASM/Colleen.o
	$(LINKER) $< -o $@ $(LIBC)

ASM/Colleen.o: $(COLLEEN_ASM)
	$(NASM) $< -o $@

C/Colleen.c: 
	$(CC) $(COLLEEN_C) $(FLAGS) -c $< -o $@

grace: ASM/Grace ASM/Grace.o C/Grace

ASM/Grace: ASM/Grace.o
	$(LINKER) $< -o $@ $(LIBC)

ASM/Grace.o: $(GRACE_ASM)
	$(NASM) $< -o $@

C/Grace.c:
	$(CC) $(GRACE_C) $(FLAGS) -c $< -o $@

sully: ASM/Sully ASM/Sully.o C/Sully

ASM/Sully: ASM/Sully.o
	$(LINKER) $< -o $@ $(LIBC)

ASM/Sully.o: $(SULLY_ASM)
	$(NASM) $< -o $@

C/Sully.c: 
	$(CC) $(SULLY_C) $(FLAGS) -c $< -o $@

clean:
	/bin/rm -f $(OBJ_ASM)

fclean: clean
	/bin/rm -f ASM/Colleen ASM/Grace ASM/Sully C/Colleen C/Grace C/Sully

re: fclean all

.PHONY: all bonus clean fclean re