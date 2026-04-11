bits 64
default rel

%define SYS_write 1
%define SYS_exit 60
%define STDOUT_FILENO 1

global _start

section .rodata
banner db "A-Vim x86_64 assembly example", 10
banner_len equ $ - banner

payload_label db "payload: "
payload_label_len equ $ - payload_label

payload db "syntax, labels, loops, syscalls"
payload_len equ $ - payload

checksum_label db "checksum: 0x"
checksum_label_len equ $ - checksum_label

newline db 10
hex_digits db "0123456789ABCDEF"

section .bss
hex_buffer resb 17                 ; 16 hex digits + newline

section .text

%macro write_stdout 2
    mov eax, SYS_write
    mov edi, STDOUT_FILENO
    lea rsi, [%1]
    mov edx, %2
    syscall
%endmacro

_start:
    ; Print the banner and a payload line first.
    write_stdout banner, banner_len
    write_stdout payload_label, payload_label_len
    write_stdout payload, payload_len
    write_stdout newline, 1

    lea rsi, [payload]
    mov ecx, payload_len
    call checksum_bytes

    write_stdout checksum_label, checksum_label_len

    lea rdi, [hex_buffer]
    call format_hex64
    mov byte [hex_buffer + 16], 10
    write_stdout hex_buffer, 17

    mov eax, SYS_exit
    xor edi, edi
    syscall

checksum_bytes:
    xor eax, eax

.sum_loop:
    test rcx, rcx
    jz .done
    movzx rdx, byte [rsi]
    add rax, rdx
    inc rsi
    dec rcx
    jmp .sum_loop

.done:
    ret

format_hex64:
    push rbx
    push rcx

    ; Convert RAX into 16 uppercase hexadecimal characters.
    lea rbx, [hex_digits]
    mov ecx, 16

.next_nibble:
    rol rax, 4
    mov rdx, rax
    and edx, 0x0F
    mov dl, [rbx + rdx]
    mov [rdi], dl
    inc rdi
    loop .next_nibble

    pop rcx
    pop rbx
    ret
