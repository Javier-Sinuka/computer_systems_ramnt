.code16

    cli

    /* Must come before they are used. */
    .equ CODE_SEG, 8
    .equ DATA_SEG, gdt_data - gdt_start

    /* Tell the processor where our Global Descriptor Table is in memory. */
    lgdt gdt_descriptor

    /* Set PE (Protection Enable) bit in CR0, effectively entering protected mode. */
    mov %cr0, %eax
    orl $0x1, %eax
    mov %eax, %cr0

    /* Far jump required to flush the instruction queue and load CS from the GDT. */
    ljmp $CODE_SEG, $protected_mode

/* Our GDT contains:
 *
 * * a null entry to fill the unusable entry 0
 * * a code and data segment spanning the whole address space
 *
 * This is enough for a minimal protected-mode demo.
 */
gdt_start:
gdt_null:
    .long 0x0
    .long 0x0
gdt_code:
    .word 0xffff
    .word 0x0
    .byte 0x0
    .byte 0b10011010
    .byte 0b11001111
    .byte 0x0
gdt_data:
    .word 0xffff
    .word 0x0
    .byte 0x0
    .byte 0b10010010
    #.byte 0b10010000 # Read/write, accessed bit cleared to 0 so the CPU sets it to 1 on first access
    .byte 0b11001111
    .byte 0x0
gdt_end:

gdt_descriptor:
    .word gdt_end - gdt_start - 1
    .long gdt_start

.code32
protected_mode:
    /* Reload all segment registers so their descriptor caches use the GDT entries. */
    mov $DATA_SEG, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss

    /* Simple stack for the demo. */
    mov $0x7000, %ebp
    mov %ebp, %esp

    /* In protected mode we avoid BIOS interrupts and write directly to VGA memory. */
    mov $msg, %esi
    mov $0xb8000, %edi

print_loop:
    lodsb
    test %al, %al
    jz halt
    movb %al, (%edi)
    movb $0x1f, 1(%edi) # Set the color attribute to bright white on black
    add $2, %edi
    jmp print_loop

halt:
    hlt
    jmp halt

msg:
    .asciz "hello with protected mode from RAMN'T grup!"
