.data
    msg_primo:    .string "O número é primo.\n"
    msg_nao_primo: .string "O número não é primo.\n"
    prompt_numero: .string "Digite um número para verificação: "

.text
.global main

main:
    # Solicitar entrada do usuário
    la a0, prompt_numero
    li a7, 4
    ecall

    # Ler número do usuário
    li a7, 5
    ecall

    # Verificar se é primo
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

# Função que verifica se um número é primo
# Entrada: a0 = número a verificar
# Saída: a0 = 1 se primo, 0 se não primo
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
