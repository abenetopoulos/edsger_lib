; double ln (double d);
; ---------------------
; This function returns the natural logarithm of a real number.

; KNOWN BUGS !!!
; 1. Does not check anything.
; 2. Does not handle exceptions.


            section .code
            global _ln

_ln         push    rbp
            mov     rbp, rsp
            sub     rsp, 32
            movupd  [rbp-24], xmm0      ; @Important: for our purposes, the size specifier should be 'tword'
            fld1                        ; 1
            fldl2e                      ; 1, log2(e)
            fdivp   st1, st0            ; 1/log2(e)
            fld     tword [rbp-24]      ; 1/log2(e), x
            fyl2x                       ; (1/log2(e)) * log2(x) == ln(x)
            fstp    tword [rbp-24]
            movupd  xmm0, [rbp-24]      ; output is expected on xmm0
            add     rsp, 32
            pop     rbp
            ret
