section .data
 source_code db "section .data%c source_code db %c%s%2$c, 0%1$c new_file db %2$cSully_%%d.s%2$c, 0%1$c index dd %d%1$c new_exec db %2$cSully_%%d%2$c, 0%1$c w db %2$cw%2$c, 0%1$c clang_and_exec db %2$cnasm -felf64 %%s && ld %%s.o -o %%s -e _start -lc -I /lib64/ld-linux-x86-64.so.2 && ./%%s%2$c, 0%1$c%1$csection .bss%1$c temp resb 4%1$c sully resb 15%1$c exec_name resb 15%1$c fptr resq 1%1$c all_cmd resb 100%1$c%1$csection .text%1$c global _start%1$c extern printf%1$c extern sprintf%1$c extern fopen%1$c extern fprintf%1$c extern fclose%1$c extern system%1$c%1$c_start:%1$c mov eax, dword [index]%1$c sub eax, 1%1$c mov dword [index], eax%1$c mov [temp], eax%1$c%1$c mov rdi, sully%1$c mov rsi, new_file%1$c movsx rdx, dword [index]%1$c xor rax, rax%1$c call sprintf%1$c%1$c mov rdi, exec_name%1$c mov rsi, new_exec%1$c mov rdx, [temp]%1$c xor rax, rax%1$c call sprintf%1$c%1$c mov rdi, sully%1$c mov rsi, w%1$c xor rax, rax%1$c call fopen%1$c mov [fptr], rax%1$c%1$c mov rdi, [fptr]%1$c mov rsi, source_code%1$c mov rdx, 0xa%1$c mov rcx, 0x22%1$c mov r8, source_code%1$c movsx r9, dword [index]%1$c xor rax, rax%1$c call fprintf%1$c%1$c movsx rax, dword [index]%1$c cmp rax, 0%1$c jl return%1$c mov rdi, all_cmd%1$c mov rsi, clang_and_exec%1$c mov rdx, sully%1$c mov rcx, exec_name%1$c mov r8, exec_name%1$c mov r9, exec_name%1$c xor rax, rax%1$c call sprintf%1$c%1$c mov rdi, [fptr]%1$c call fclose%1$c mov rdi, all_cmd%1$c call system%1$c pop rdi%1$c mov rax, 60%1$c xor rdi, rdi%1$c syscall%1$c%1$creturn:%1$c mov rdi, [fptr]%1$c call fclose%1$c pop rdi%1$c mov rax, 60%1$c xor rdi, rdi%1$c syscall", 0
 new_file db "Sully_%d.s", 0
 index dd 5
 new_exec db "Sully_%d", 0
 w db "w", 0
 clang_and_exec db "nasm -felf64 %s && ld %s.o -o %s -e _start -lc -I /lib64/ld-linux-x86-64.so.2 && ./%s", 0

section .bss
 temp resb 4 ; temporaire
 sully resb 15 ; static 15 allow bytes
 exec_name resb 15
 fptr resq 1 ; 8 bytes
 all_cmd resb 100 ; 100 bytes

section .text
 global _start
 extern printf
 extern sprintf
 extern fopen
 extern fprintf
 extern fclose
 extern system

_start:
 mov eax, dword [index]
 sub eax, 1
 mov dword [index], eax
 mov [temp], eax

 mov rdi, sully
 mov rsi, new_file
 movsx rdx, dword [index]
 xor rax, rax
 call sprintf

 mov rdi, exec_name
 mov rsi, new_exec
 mov rdx, [temp]
 xor rax, rax
 call sprintf

 mov rdi, sully
 mov rsi, w
 xor rax, rax
 call fopen
 mov [fptr], rax

 mov rdi, [fptr]
 mov rsi, source_code
 mov rdx, 0xa
 mov rcx, 0x22
 mov r8, source_code
 movsx r9, dword [index]
 xor rax, rax
 call fprintf

 movsx rax, dword [index]
 cmp rax, 0
 jl return
 mov rdi, all_cmd
 mov rsi, clang_and_exec
 mov rdx, sully
 mov rcx, exec_name
 mov r8, exec_name
 mov r9, exec_name
 xor rax, rax
 call sprintf

 mov rdi, [fptr]
 call fclose
 mov rdi, all_cmd
 call system
 pop rdi
 mov rax, 60
 xor rdi, rdi
 syscall

return:
 mov rdi, [fptr]
 call fclose
 pop rdi
 mov rax, 60
 xor rdi, rdi
 syscall