section .data
 source_code db "section .data%1$c source_code db %2$c%3$s%2$c, 0%1$c new_file db %2$cGrace_kid.s%2$c, 0%1$c w db %2$cw%2$c, 0%1$c%1$csection .bss%1$c fptr resq 1%1$c%1$csection .text%1$c global _start%1$c extern fopen%1$c extern fprintf%1$c extern fclose%1$c%1$c%%macro write_file 1%1$c mov rdi, [fptr]%1$c mov rsi, source_code%1$c mov rdx, 0xa%1$c mov rcx, 0x22%1$c mov r8, source_code%1$c xor rax, rax%1$c call fprintf%1$c%%endmacro%1$c%1$c%%macro exit 0%1$c mov rdi, [fptr]%1$c call fclose%1$c pop rdi%1$c mov rax, 60%1$c xor rdi, rdi%1$c syscall%1$c%%endmacro%1$c%1$c%%macro start 0%1$c _start:%1$c  mov rdi, new_file%1$c  mov rsi, w%1$c  xor rax, rax%1$c  call fopen%1$c  mov [fptr], rax%1$c  write_file fptr%1$c  exit%1$c%%endmacro%1$c%1$cstart", 0
 new_file db "Grace_kid.s", 0
 w db "w", 0

section .bss
 fptr resq 1

section .text
 global _start
 extern fopen
 extern fprintf
 extern fclose

%macro write_file 1
 mov rdi, [fptr]
 mov rsi, source_code
 mov rdx, 0xa
 mov rcx, 0x22
 mov r8, source_code
 xor rax, rax
 call fprintf
%endmacro

%macro exit 0
 mov rdi, [fptr]
 call fclose
 pop rdi
 mov rax, 60
 xor rdi, rdi
 syscall
%endmacro

%macro start 0
 _start:
  mov rdi, new_file
  mov rsi, w
  xor rax, rax
  call fopen
  mov [fptr], rax
  write_file fptr
  exit
%endmacro

start