.data
    vetor:      .word 1, 2, 6, 4, 5
    msg_resultado: .string "A soma dos elementos do vetor �: "
    nova_linha: .string "\n"

.text
.global main

main:
    # Preparar chamada da fun��o
    la a0, vetor      # Endere�o do vetor
    li a1, 4          # �ndice inicial (tamanho-1 = 4 para vetor de 5 elementos)

    # Chamar fun��o recursiva
    jal ra, somar_vetor_recursivo

    # Imprimir resultado
    mv t0, a0         # Salvar resultado

    la a0, msg_resultado
    li a7, 4
    ecall

    mv a0, t0
    li a7, 1
    ecall

    la a0, nova_linha
    li a7, 4
    ecall

    # Terminar programa
    li a7, 10
    ecall

# Fun��o recursiva que soma elementos de um vetor
# Entrada: a0 = endere�o do vetor, a1 = �ndice atual
# Sa�da: a0 = soma dos elementos
somar_vetor_recursivo:
    addi sp, sp, -16       # Reserva espa�o para 4 palavras (16 bytes)
    sw ra, 12(sp)          # Salva o endere�o de retorno
    sw s0, 8(sp)           # Salva s0 (endere�o do vetor)
    sw s1, 4(sp)           # Salva s1 (�ndice atual)
    sw s2, 0(sp)           # Salva s2 (valor do elemento atual)

    mv s0, a0              # s0 = endere�o do vetor
    mv s1, a1              # s1 = �ndice atual

    blt s1, zero, caso_base  # Se �ndice < 0, caso base

    # Carrega elemento atual vetor[indice]
    slli t0, s1, 2         # t0 = �ndice * 4 (tamanho de word)
    add t0, s0, t0         # t0 = endere�o do elemento
    lw s2, 0(t0)           # s2 = vetor[indice] (valor atual)

    # Chamada recursiva para somar elementos anteriores
    addi a1, s1, -1        # a1 = �ndice - 1
    jal ra, somar_vetor_recursivo

    # Soma o resultado da recurs�o com o elemento atual
    add a0, a0, s2         # a0 = resultado_recurs�o + vetor[indice]
    j fim_recursao

caso_base:
    li a0, 0               # Caso base: retorna 0

fim_recursao:
    lw s2, 0(sp)           # Restaura s2
    lw s1, 4(sp)           # Restaura s1
    lw s0, 8(sp)           # Restaura s0
    lw ra, 12(sp)          # Restaura ra
    addi sp, sp, 16        # Libera espa�o na pilha
    ret                    # Retorna
