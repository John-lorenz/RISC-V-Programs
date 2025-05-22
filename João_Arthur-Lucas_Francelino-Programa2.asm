# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação M2 – Programação em Linguagem de Montagem
# Programa 02 - Imprimir 10 primos a partir de 100
# Grupo: - João Arthur dos Santos Lorenzoni
#        - Lucas Francelino

.data
    espaco: .string " "
    msg_inicio: .string "Os 10 primeiros números primos a partir de 100 são:\n"

.text
.global main

main:
    # Imprimir mensagem inicial
    la a0, msg_inicio
    li a7, 4
    ecall

    # Chamar função para imprimir primos
    jal ra, imprimirPrimos

    # Terminar programa
    li a7, 10
    ecall

# Função que imprime 10 números primos a partir de 100
imprimirPrimos:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw s0, 4(sp)
    sw s1, 0(sp)

    li s0, 0       # contador de primos
    li s1, 100     # número inicial

loop_imprimir:
    mv a0, s1
    jal ra, ehPrimo
    beqz a0, nao_primo

    # Imprimir número primo
    mv a0, s1
    li a7, 1
    ecall

    # Imprimir espaço
    la a0, espaco
    li a7, 4
    ecall

    addi s0, s0, 1

nao_primo:
    addi s1, s1, 1
    li t0, 10
    blt s0, t0, loop_imprimir

    lw ra, 8(sp)
    lw s0, 4(sp)
    lw s1, 0(sp)
    addi sp, sp, 12
    ret

# Função de verificação de primo (igual ao Programa 1)
ehPrimo:
    li t0, 2
    blt a0, t0, naoEh
    beq a0, t0, eh

    li t1, 2

loop_ehPrimo:
    mul t2, t1, t1
    bgt t2, a0, eh
    rem t3, a0, t1
    beqz t3, naoEh
    addi t1, t1, 1
    j loop_ehPrimo

eh:
    li a0, 1
    ret

naoEh:
    li a0, 0
    ret