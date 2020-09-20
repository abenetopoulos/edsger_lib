; function formatInteger (var buffer : array of char; i : integer;
;                         width, flags, base : byte) : byte
; ----------------------------------------------------------------
; This procedure formats an integer for printing.
; 

            section .code
            global  _formatInteger

;CHAR_SPACEPAD  equ     ' '
;FLAG_LEFTALIGN equ     00h
;FLAG_ZEROPAD   equ     02h
;FLAG_UPPERCASE equ     40h
CHAR_MINUS      equ     '-'

_formatInteger:
            push    rbp
            mov     rbp, rsp
            push    rdi
            push    rsi
            push    rbx
            mov     rdx, 0
            mov     r8, 0
            mov     eax, esi
	    shr     eax, 31
	    and     al, 1  
            jz      prepare
	    not     esi
            inc     esi

            mov     byte [rdi], CHAR_MINUS
            inc     rdi
prepare:
	    mov edx, 0
	    mov eax, esi
	    mov ebx, 0xa  
	    mov rcx, 0x1   ; we keep here a counter for units in order to loop ..
    
find_units_10:
	    div ebx
	    push dx   ; store units in stack
	    cmp eax, 0 ; quotient is not zero yet so keep finding units
	    je writeDigitToMemory
	    inc cx    ; count units
	    mov edx, 0
	    jmp find_units_10
    
writeDigitToMemory:
	    pop dx    ; load from store units one  by one 
	    add dx, 30h ; convert to ascii in order to print it
	    mov byte [rdi], dl 
	    inc rdi
	    loop writeDigitToMemory  ; loop for all digits (that's why we kept counter in cx)
   



finish:
            mov     byte [rdi], 0x0
            pop     rbx
            pop     rsi
            pop     rdi
            pop     rbp
            mov     ax, cx              ;return number of characters written
            and     rax, 0xff
            ret


