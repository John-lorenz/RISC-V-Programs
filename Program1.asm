# Disciplina: Arquitetura e Organiza��o de Processadores
# Atividade: Avalia��o M2 � Programa��o em Linguagem de Montagem
# Programa 01 - Verifica��o de n�mero primo
# Grupo: - Jo�o Arthur dos Santos Lorenzoni
#        - Lucas Francelino

.data
    msg_primo:    .string "O n�mero � primo.\n"
    msg_nao_primo: .string "O n�mero n�o � primo.\n"
    prompt_numero: .string "Digite um n�mero para verifica��o: "

.text
.global main

main:
    # Solicitar entrada do usu�rio
    la a0, prompt_numero
    li a7, 4
    ecall

    # Ler n�mero do usu�rio
    li a7, 5
    ecall

    # Verificar se � primo
    jal ra, ehPrimo

    # Exibir resultado
    beqz a0, nao_primo
    la a0, msg_primo
    j imprimir

nao_primo:
    la a0, msg_nao_primo

imprimir:
    li a7, 4
    ecall

    # Terminar programa
    li a7, 10
    ecall

# Fun��o que verifica se um n�mero � primo
# Entrada: a0 = n�mero a verificar
# Sa�da: a0 = 1 se primo, 0 se n�o primo
ehPrimo:
    li t0, 2
    blt a0, t0, naoEh
    beq a0, t0, eh

    li t1, 2

loop:
    mul t2, t1, t1
    bgt t2, a0, eh
    rem t3, a0, t1
    beqz t3, naoEh
    addi t1, t1, 1
    j loop

eh:
    li a0, 1
    ret

naoEh:
    li a0, 0
    ret
