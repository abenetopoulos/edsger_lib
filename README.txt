To build : 
>./libs.sh

A file called 'lib.a' is generated

----------------------------------------------------------------------------------
abs : di -> ax
atan : xmm0 -> xmm0
cos : xmm0 -> xmm0
exp : xmm0 -> xmm0
fabs : xmm0 -> xmm0
ln : xmm0 -> xmm0
pi : - -> xmm0
sin : xmm0 -> xmm0
sqrt : xmm0 -> xmm0
tan : xmm0 -> xmm0

readBoolean : - -> al
readCharacter : - -> al
readInteger : - -> ax
readReal : - -> xmm0
readString : rdi (size), rsi (pointer to char array) -> -
writeBoolean : dil -> -
writeCharacter : dil -> -
writeInteger : di -> -
writeReal : xmm0 -> -
writeString : rdi (pointer to char array) -> -


chr : dil -> al
exit : di -> -
ord : dil -> ax
round : xmm0 -> ax
trunc : xmm0 -> ax

strcat : rdi (pointer to target array), rsi (pointer to source array) -> -
strcmp : rdi (pointer to target array), rsi (pointer to source array) -> ax
strcpy : rdi (pointer to target array), rsi (pointer to source array) -> -
strlen : rdi (pointer to char array) -> ax
