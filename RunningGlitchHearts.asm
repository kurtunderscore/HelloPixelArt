#Author: KRT_, KRT_c0c4!N3, kurtunderscore, kurtnextdoor

[ORG 0x7c00]      

   xor ax, ax     
   mov ds, ax    

   mov ss, ax     
   mov sp, 0x9c00 
 
   mov ax, 0xb800 
   mov es, ax     

   mov al, 0x03
   xor ah, ah
   int 0x10

   mov al, 0x03                   
   
   mov ch, 0x26
   inc ah
   int 0x10 

mov cx, 0x07d0
mov ax, 0x0D20
xor di, di
rep stosw

xor di, di
mov cx, 0x07d0
loopchart:
	mov bx, [0x046C]
	add bx, 1 
	delay:
	cmp [0x046C], bx
	jb delay
	rdtsc
	shl ax, 8
	mov al, 0x03
	stosw
	jmp loopchart

;BIOS sig and padding
   times 510-($-$$) db 0
   dw 0xAA55   
