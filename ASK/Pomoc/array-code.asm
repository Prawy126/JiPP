         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

         call getaddr
array:                 ;    +4 +8
         times 3 dd 0  ; [0][0][0]  ; 3 times define double word 0
getaddr:

;        esp -> [array][ret]

         mov ebp, [esp]  ; ebp = *(int*)esp = array

         mov dword [ebp+0], 3  ; *(int*)(ebp+0) = *(int*)(array+0) = 3
         mov dword [ebp+4], 5  ; *(int*)(ebp+4) = *(int*)(array+4) = 5
         mov dword [ebp+8], 7  ; *(int*)(ebp+8) = *(int*)(array+8) = 7

;           +4 +8
; array  [3][5][7]

         push dword [ebp+8]  ; *(int*)(ebp+8) = *(int*)(array+8) = 7 -> stack
         push dword [ebp+4]  ; *(int*)(ebp+4) = *(int*)(array+4) = 4 -> stack
         push dword [ebp+0]  ; *(int*)(ebp+0) = *(int*)(array+0) = 3 -> stack

;        esp -> [3][5][7][array][ret]

         call getaddr2
format:
         db "        0  1  2", 0xA
         db "tab -> [%i][%i][%i]", 0xA, 0
getaddr2:

;        esp -> [format][3][5][7][array][ret]

         call [ebx+3*4]  ; printf(...);
         add esp, 5*4    ; esp = esp + 20

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