section .data
source_code: db "section .data%csource_code: db %c%s%c%csection .text%c global _start%c extern printf%c; YO%c_start:%c mov rdi, source_code ; YO2%c mov rsi, 0xa%c mov rdx, 0x22%c mov rcx, source_code%c mov r8, 0x22%c mov r9, 0xa%c xor ecx, ecx%c jmp loop_start%cloop_start:%c cmp ecx, 30%c je end%c push 0xa%c inc ecx%c jmp loop_start%cend:%c xor ecx, ecx%c mov rcx, source_code%c xor rax, rax%c call printf%c pop rdi%c mov rax, 60%c xor rdi, rdi%c syscall%c"
section .text
 global _start
 extern printf
; YO
_start:
 mov rdi, source_code ; YO2
 mov rsi, 0xa
 mov rdx, 0x22
 mov rcx, source_code
 mov r8, 0x22
 mov r9, 0xa
 xor ecx, ecx
 jmp loop_start
loop_start:
 cmp ecx, 30
 je end
 push 0xa
 inc ecx
 jmp loop_start
end:
 xor ecx, ecx
 mov rcx, source_code
 xor rax, rax
 call printf
 pop rdi
 mov rax, 60
 xor rdi, rdi
 syscall