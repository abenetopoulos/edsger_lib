; function parseInteger (var buffer : array of char; p : ^integer;
;                        base : byte) : byte
; ----------------------------------------------------------------
; This procedure parses an integer number.  It ignores leading
; spaces and returns the number of characters read.

; parse an integer from buffer, store the read integer in the address pointed to by p, and use the base encoding in base to do so

;KNOWN BUGS:
;   - at the moment, we only parse decimal numbers...

        section .code
        global  _parseInteger

_parseInteger:
        push    rbp
        mov	rbp, rsp
        push    rdi                     ;push non-volatile regs
        push    rsi
	push    rdx
	push    rcx
        xor     rax, rax                ;number of chars read
        xor     r9, r9                  ;temp result storage
        mov     r11b, 0                 ;sign flag (perhaps an entire reg is too much?)

.ignoreWhiteSpace:
        cmp     byte [rdi], 0x20        
        jnz     .readSign
        inc     rdi
        jmp     .ignoreWhiteSpace 
.readSign:
        cmp     byte [rdi], 0x2d
        jnz     .readDec
        mov     r11b, 1
        inc     rdi
.readDec:
        cmp     byte [rdi], 0x30
        jl      .applySign
        cmp     byte [rdi], 0x39
        jg      .applySign
        mov     r10b, byte [rdi]
        sub     r10b, 0x30
        and     r10,0xff
        imul    r9, 10
        add     r9, r10
        mov     rdx, 0x80000000
	cmp     r9, rdx
        ja     .overflow
        inc     rax
        jmp     .nextChar
.nextChar:
        inc     rdi
        jmp     .readDec
.applySign:
        cmp     r11b, 1
        jne     .checkPosOver
        cmp     r9, rdx
        je      .finish
        neg     r9
        jmp     .finish
.checkPosOver:
	mov     rcx, 0x7fffffff
        cmp     r9, rcx
        jbe     .finish
.overflow:
        mov     r9, 0x00
        mov     rax, -1
.finish: 
	pop 	rcx
	pop 	rdx
	pop 	rsi
        mov     qword [rsi], r9
        pop     rdi
        pop     rbp
        ret
