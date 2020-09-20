; void writeInteger (int n);
; --------------------------
; This function prints an integer to the standard output.


                section .code
                global  _writeInteger
                extern  _formatInteger
                extern  _writeString

_writeInteger   push    rbp
                mov     rbp, rsp
                push    rdi
                push    rsi
               
			    xor     rsi, rsi
                mov     esi, edi 
                lea     rdi, [buffer]
                call    _formatInteger
                
                lea     rdi, [buffer]
                call    _writeString
                
                pop     rsi
                pop     rdi
                mov     rsp, rbp
                pop     rbp
                ret

                section .bss
buffer  resb 32 
