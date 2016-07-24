; double cos (double d);
; ----------------------
; This function returns the cosine of a real number.

; KNOWN BUGS !!!
; 1. Does not handle exceptions.

              section .code
              global _cos

_cos    push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        movupd  [rbp-24], xmm0          ; x
        fld     tword [rbp-24]          ; @Important: for our purposes, the size specifier should be 'tword'
        fcos                            ; cos(x)
        fstp    tword [rbp-24]
        movupd  xmm0, [rbp-24]
        add     rsp, 32
        pop     rbp
        ret
