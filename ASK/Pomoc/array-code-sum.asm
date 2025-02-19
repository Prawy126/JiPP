         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

;        1 + 2 + ... + n = n*(n+1)/2

n        equ 10

;        n = 10
;        1 + 2 + ... + 10 = 10*11/2 = 5*11 = 55

         call getaddr

array    times n dd 0  ; n times define double word 0

; array  [0][0][0][0][0][0][0][0][0][0]

getaddr:

;        esp -> [array][ret]

         mov ebp, [esp]  ; ebp = *(int*)esp = array

         mov ecx, n  ; ecx = n
         
.loop    mov [ebp+4*ecx-4], ecx  ; *(int*)(ebp+4*ecx-4) = *(int*)(array+4*ecx-4) = ecx

         loop .loop

;           +4                      +36
; array  [1][2][3][4][5][6][7][8][9][10]

         mov esi, 0  ; esi = 0

         mov eax, 0            ; eax = 0
.loop2   add eax, [ebp+4*esi]  ; eax = eax + *(int*)(ebp+4*esi) = eax + *(int*)(array+4*esi)

         inc esi  ; esi++

         cmp esi, n  ; esi - n       ; OF SF ZF AF PF CF affected
         jb .loop2   ; jump if below ; jump if CF = 1

         push eax  ; eax -> stack

;        esp -> [eax][array][ret]

         call getaddr2
format:
         db "sum = %d", 0xA, 0
getaddr2:

;        esp -> [format][eax][array][ret]

         call [ebx+3*4]  ; printf("sum = %d\n", eax);
         add esp, 3*4    ; esp = esp + 12

;        esp -> [ret]

         push 0          ; esp -> [0][ret]
         call [ebx+0*4]  ; exit(0);

; asmloader API
;
; ESP wskazuje na prawidlowy stos
; argumenty funkcji wrzucamy na stos
; EBX zawiera pointer na tablice API
;
; call [ebx + NR_FUNKCJI*4] ; wywolanie funkcji API
;
; NR_FUNKCJI:
;
; 0 - exit
; 1 - putchar
; 2 - getchar
; 3 - printf
; 4 - scanf
;
; To co funkcja zwróci jest w EAX.
; Po wywolaniu funkcji sciagamy argumenty ze stosu.
;
; https://gynvael.coldwind.pl/?id=387