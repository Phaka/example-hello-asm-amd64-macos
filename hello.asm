; macOS x64 assembly Hello World
; Build with: nasm -f macho64 hello.asm
; Link with: ld -macosx_version_min 10.7.0 -lSystem hello.o -o hello

default rel                         ; Use RIP-relative addressing

global _main                        ; Program entry point for macOS
extern _exit                        ; System library functions

section .data
msg:    db      'Hello, World!', 10 ; Message with Unix newline
.len:   equ     $ - msg            ; Message length

section .text
_main:
    ; macOS syscall for write(2)
    mov     rax, 0x2000004         ; macOS write syscall number
    mov     rdi, 1                 ; File descriptor 1 is stdout
    lea     rsi, [msg]             ; Address of string to output
    mov     rdx, msg.len           ; Length of string
    syscall                        ; Invoke syscall

    ; Exit cleanly using C runtime
    xor     rdi, rdi               ; Exit code 0
    call    _exit                  ; Clean exit through C runtime

    ; We never get here
    ret
