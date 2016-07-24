; double pi ();
; -------------
; This function returns the real number pi (3.1415926535...).


             section .code
             global _pi

_pi          push      rbp
             mov       rbp, rsp
             sub       rsp, 32
             fldpi
             fstp      tword [rbp-24]      ; store result
                                           ; @Important: for our purposes, the size specifier should be 'tword'
             movupd    xmm0, [rbp-24]      ; output is expected on xmm0
             add       rsp, 32
             pop       rbp
             ret
