; double sin (double d);
; ----------------------
; This function returns the sine of a real number.

; KNOWN BUGS !!!
; 1. Does not handle exceptions.


              section   .code
              global    _sin

_sin          push      rbp
              mov       rbp, rsp
              sub       rsp, 32
              movupd    [rbp-24], xmm0   
              fld       tword [rbp-24]      ; @Important: for our purposes, the size specifier should be 'tword'
              fsin                            ; sin(x)
              fstp      tword [rbp-24]      ; store result
              movupd    xmm0, [rbp-24]      ; output is expected on xmm0
              add       rsp, 32
              pop       rbp
              ret
