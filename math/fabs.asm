; double fabs (double d);
; -----------------------
; This function returns the absolute value of a real number.


        section .code
        ;section .text
        global _fabs
        

_fabs       push    rbp
            mov     rbp, rsp
            sub     rsp, 32
            movupd  [rbp-24], xmm0   
            fld     tword [rbp-24]      ; @Important: for our purposes, the size specifier should be 'tword'
            fabs
            fstp    tword [rbp-24]      ; store result
            movupd  xmm0, [rbp-24]      ; output is expected on xmm0
            add     rsp, 32
            pop     rbp
            ret
