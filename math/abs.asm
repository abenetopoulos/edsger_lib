; int abs (int n);
; ----------------
; This function returns the absolute value of an integer.

        section .code

        global _abs

_abs    push    rbp
        mov     rbp, rsp
		xor     rax, rax
        mov     eax, edi              ; 1st parameter
        or      eax, eax              ; If it is negative
        jge     ok
        neg     eax                  ; i = -i
ok:
		xor     rbx, rbx
		mov     ebx, 0xffffffff
        and     eax, ebx
        pop     rbp
        ret
