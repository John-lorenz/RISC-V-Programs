<h2> RISC-V Programs </h2>
Este repositório contém uma coleção de programas escritos em Assembly para a arquitetura RISC-V, desenvolvidos como parte das atividades acadêmicas da disciplina de Organização e Arquitetura de Computadores.

<h2> Objetivo </h2> 
O objetivo principal destes programas é auxiliar no aprendizado prático da linguagem Assembly RISC-V, abordando conceitos fundamentais como manipulação de vetores, estruturas de controle, chamadas de sistema (syscalls) e implementação de algoritmos básicos.

<h2> 📄 Programas </h2> 
<p>✅ Programa 01 — Verificação de número primo
Descrição:
Este programa implementa um procedimento que recebe um número inteiro e retorna 1 se for primo ou 0 caso contrário.
O algoritmo realiza divisões sucessivas até √n para verificar se o número possui algum divisor além de 1 e ele mesmo. </p>

<h4> Características: </h4>

Procedimento folha (não chama outros procedimentos).

Não utiliza pseudo-instruções (exceto la, permitido).

Preserva os registradores conforme as boas práticas da disciplina.

<h3>✅ Programa 02 — Impressão de 10 números primos a partir de 100 </h3>
Descrição:
Este programa imprime os 10 primeiros números primos a partir do número 100. Ele reutiliza o procedimento do Programa 01 para verificar se cada número é primo.

<h4> Características: </h4>

Procedimento não folha (chama outro procedimento).

Usa laço e chamada da função de verificação de primo.

Preserva os registradores corretamente.

<h3> ✅ Programa 03 — Soma recursiva dos elementos de um vetor </h3>
Descrição:
Este programa recebe um vetor de inteiros e calcula a soma de todos os seus elementos usando recursão.

<h4> Características: </h4>

Implementa um procedimento recursivo, que chama ele mesmo até atingir o índice -1.

Usa manipulação de memória e ponteiros aritméticos para percorrer o vetor.

