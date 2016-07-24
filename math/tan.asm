; double tan (double d);
; ----------------------
; This function returns the tangent of a real number.

; KNOWN BUGS !!!
; 1. Does not handle exceptions.
; 2. Ignores the abnormal case that 1.0 was not pushed.

            section .code
            global _tan

_tan        push    rbp
            mov     rbp, rsp
            sub     rsp, 32
            movupd  [rbp-24], xmm0   
            fld     tword [rbp-24]      ; @Important: for our purposes, the size specifier should be 'tword'
            fptan
            ffree   st0                 ; pop the 1.0 that is
            fincstp                     ; pushed by fptan
            fstp    tword [rbp-24]      ; store result
            movupd  xmm0, [rbp-24]      ; output is expected on xmm0
            add     rsp, 32
            pop     rbp
            ret
