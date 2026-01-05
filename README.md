# ENGG56 – Projeto de Circuitos Integrados Digitais (2025.2)

Este repositório contém a implementação em Verilog, simulações funcionais e análises temporais referentes ao **Trabalho em Grupo** da disciplina **ENGG56 – Projeto de Circuitos Integrados Digitais**, ministrada pelo Prof. Wagner L. A. de Oliveira, na **UFBA**.

O projeto foi desenvolvido visando síntese no **Quartus** para a placa **DE2-115**, com simulações no **ModelSim** e análise temporal via **TimeQuest Timing Analyzer**, conforme solicitado no enunciado.

---

Cada questão foi organizada em diretórios independentes, permitindo compilação, simulação e análise temporal separadas.

---

## ⚙️ Ferramentas Utilizadas

- Quartus Prime – Síntese e place&route (DE2-115)
- ModelSim – Simulação funcional (testbench)
- TimeQuest Timing Analyzer – Análise temporal
- Verilog HDL – Descrição dos circuitos
- LaTeX – Elaboração do relatório

---

## 🧠 Destaques de Implementação

### Questão 2 – FSM + Acumulador + SRAM
- Arquitetura síncrona baseada em FSM e acumulador de 16 bits
- Interface com memória externa modelada em testbench
- Respeito à latência de 1 ciclo da SRAM
- Sinais de controle (`Load`, `Transfer`, `Clear`) implementados como **pulsos de habilitação síncronos**, avaliados na borda do clock do sistema
- Análise temporal realizada com clock real da placa (50 MHz) e restrições completas de entrada e saída

### Questão 4 – Controlador de Tráfego
- Circuito puramente combinacional
- Implementação otimizada via mapas de Karnaugh
- Testbench percorre todas as 16 combinações possíveis dos sensores
- Análise temporal feita por meio de `set_max_delay`, sem uso de clock
- Caminhos de *hold* declarados como *false path*, por não se aplicarem a circuitos combinacionais

---

## ⏱️ Análise Temporal (TimeQuest)

- **Circuitos síncronos (Q2/Q3):**
  - `create_clock` compatível com a DE2-115
  - `set_input_delay` e `set_output_delay` para evitar caminhos não restritos
  - `set_false_path` para o reset assíncrono

- **Circuito combinacional (Q4):**
  - Uso de `set_max_delay` entre entradas e saídas
  - Exclusão explícita da análise de *hold*

Todos os projetos apresentam relatórios de timing consistentes, sem *unconstrained paths* relevantes.

---

## 👥 Autores

Trabalho desenvolvido em grupo (máx. 3 integrantes), conforme especificação do enunciado.

---

## 📌 Observações Finais

Este repositório foi estruturado com foco em:
- Clareza de organização
- Aderência ao enunciado
- Boas práticas de projeto em FPGA
- Coerência entre implementação, simulação e análise temporal

Cada questão pode ser analisada de forma independente, facilitando a verificação e reprodução dos resultados.


