; int round (double d);
; ---------------------
; This function converts a real number to an integer by rounding.

            section .code
            global _round

_round      push    rbp
            sub     rsp, 32
            movupd  [rbp-24], xmm0   
            fld     tword [rbp-24]      ; @Important: for our purposes, the size specifier should be 'tword'
            frndint
            fistp   word [rbp-8]
            mov     ax, word [rbp-8]
            and     rax, 0xffff
            add     rsp, 32
            pop     rbp
            ret
