.org 0024h ;;para usar o trap e o programa funcionar sem precisar resetar
	mvi a,00h
	out 00h
	out 01h
	in 00h
	mov c,a ;; seg num movido para C
	in 01h
	mov b,a ;; primeiro num movido para B
	mvi d,00h ;; contador de carry
	mvi a, 00h ;; garantindo que o acumulador comeca com 0
loop2:add b
	jnc loop ;; se nao tiver carry, nao eh necessario mexer em D
	inr d;; se tiver carry ao fazer a soma, D eh incrementado (onde armazena os MSB)
loop: dcr c    ;; toda vez que é feita a multiplicacao diminui 1
	jnz loop2;; repete o processo se C nao for 0
	out 00h;; se C for 0 o numero do acumulador(LSB) ja eh passado para o seu out
	mov a,d;; se C for 0 o numero do acumulador(HSB) ja eh passado para o seu out
	out 01h
	hlt 
