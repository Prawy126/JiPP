         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

         sub esp, 3*4  ; esp = esp - 12

;                  +4 +8
;        esp -> [ ][ ][ ][ret]

         mov dword [esp+0], 3  ; *(int*)(esp+0) = 3
         mov dword [esp+4], 5  ; *(int*)(esp+4) = 5
         mov dword [esp+8], 7  ; *(int*)(esp+8) = 5

;        esp -> [3][5][7][ret]

         call getaddr
format:
         db "        0  1  2", 0xA
         db "tab -> [%i][%i][%i]", 0xA, 0
getaddr:

;        esp -> [format][3][5][7][ret]

         call [ebx+3*4]  ; printf(...);
         add esp, 4*4    ; esp = esp + 16

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