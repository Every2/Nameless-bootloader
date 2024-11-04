BITS 16
ORG 0X7C00

Stage1_entrypoint:
    jmp 0x0000:.setup_segments
    .setup_segments:
        xor ax, ax
        mov ss, ax
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov sp, Stage1_entrypoint
        cld
    
    mov [disk], dl
    mov ax, (stage2_start - stage1_start)/512
    mov cx, (kernel_end - stage2_start)/512
    mov bx, stage2_start
    xor dx, dx
    call Real_mode_read_disk

    mov si, stage1_message
    call Real_mode_println

    jmp Stage2_entrypoint
    
    .halt: hlt
    jmp .halt

%include "stage1/disk.asm"
%include "stage1/print.asm"

times 510-($-$$) db 0
dw 0xAA55