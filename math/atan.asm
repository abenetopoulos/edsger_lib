; double atan (double d);
; -----------------------
; This function returns the arc tangent of a real number.

; KNOWN BUGS !!!
; 1. Does not handle exceptions.


        section .code

        global _atan

_atan   push         rbp
        mov          rbp, rsp
        sub          rsp, 32
        movupd       [rbp-24], xmm0   
        fld          tword [rbp-24]      ; @Important: for our purposes, the size specifier should be 'tword'
        fld1
        fpatan
        fstp         tword [rbp-24]      ; store result
        movupd       xmm0, [rbp-24]      ; output is expected on xmm0
        add          rsp, 32
        pop          rbp
        ret
