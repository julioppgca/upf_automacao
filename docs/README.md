# Índice das Aulas — Automação com CLP / OpenPLC / ESP32

Cada módulo é uma pasta numerada (ordem sugerida de estudo). Dentro de
cada uma:

- **`<nome-da-aula>.md`** — a aula completa.
- **`quadro-resumo.md`** — versão condensada em tópicos, pronta para
  escrever ou projetar no quadro durante a aula.
- **`images/`** — diagramas (SVG) feitos para a aula.
- **`capturas/`** — prints reais do OpenPLC Editor (quando existirem).

## Módulos

| # | Pasta | Aula | Resumo de quadro |
|---|---|---|---|
| 01 | [01-introducao-clp/](01-introducao-clp/) | [introducao-clp.md](01-introducao-clp/introducao-clp.md) | [quadro-resumo.md](01-introducao-clp/quadro-resumo.md) |
| 02 | [02-linguagem-ladder/](02-linguagem-ladder/) | [linguagem-ladder.md](02-linguagem-ladder/linguagem-ladder.md) ([PDF](02-linguagem-ladder/linguagem-ladder.pdf)) | [quadro-resumo.md](02-linguagem-ladder/quadro-resumo.md) |
| 03 | [03-evolucao-ladder/](03-evolucao-ladder/) | [evolucao-ladder.md](03-evolucao-ladder/evolucao-ladder.md) | [quadro-resumo.md](03-evolucao-ladder/quadro-resumo.md) |
| 04 | [04-partida-motor-esp32/](04-partida-motor-esp32/) | [partida-motor-esp32.md](04-partida-motor-esp32/partida-motor-esp32.md) | [quadro-resumo.md](04-partida-motor-esp32/quadro-resumo.md) |
| 05 | [05-tutorial-openplc-esp32/](05-tutorial-openplc-esp32/) | [tutorial-openplc-esp32.md](05-tutorial-openplc-esp32/tutorial-openplc-esp32.md) ([PDF](05-tutorial-openplc-esp32/tutorial-openplc-esp32.pdf)) | [quadro-resumo.md](05-tutorial-openplc-esp32/quadro-resumo.md) |
| 06 | [06-bordas-set-reset-temporizadores/](06-bordas-set-reset-temporizadores/) | [bordas-set-reset-temporizadores.md](06-bordas-set-reset-temporizadores/bordas-set-reset-temporizadores.md) | [quadro-resumo.md](06-bordas-set-reset-temporizadores/quadro-resumo.md) |
| 07 | [07-variaveis-openplc/](07-variaveis-openplc/) | [variaveis-openplc.md](07-variaveis-openplc/variaveis-openplc.md) | [quadro-resumo.md](07-variaveis-openplc/quadro-resumo.md) |
| 08 | [08-termostato-simulado/](08-termostato-simulado/) | [enunciado](08-termostato-simulado/termostato-simulado-enunciado.md) (aluno) / [gabarito](08-termostato-simulado/termostato-simulado-gabarito.md) (professor) *(rascunho — sem montagem ainda)* | — |
| 09 | [09-funcoes/](09-funcoes/) | [funcoes.md](09-funcoes/funcoes.md) ([PDF](09-funcoes/funcoes.pdf)) *(prévia — em andamento)* | [quadro-resumo.md](09-funcoes/quadro-resumo.md) |
| 10 | [10-partida-sequencial-motores/](10-partida-sequencial-motores/) | [enunciado](10-partida-sequencial-motores/partida-sequencial-motores-enunciado.md) ([PDF](10-partida-sequencial-motores/partida-sequencial-motores-enunciado.pdf)) (aluno) / [gabarito](10-partida-sequencial-motores/partida-sequencial-motores-gabarito.md) ([PDF](10-partida-sequencial-motores/partida-sequencial-motores-gabarito.pdf)) (professor) *(rascunho — sem montagem ainda)* | — |

## Conteúdo de cada módulo

1. **Introdução ao CLP** — o que é um controlador, E/S, ciclo de
   varredura, relação com microcontroladores.
2. **Linguagem Ladder** — elementos básicos, operações lógicas (Ladder ×
   Structured Text) e as 5 linguagens da IEC 61131-3.
3. **Evolução do Ladder** — contato elétrico → porta lógica → Ladder
   (série=AND, paralelo=OR, NF=NOT).
4. **Partida de motor com ESP32** — pinagem, pull-down obrigatório,
   circuito de potência isolado (relé + contator).
5. **Tutorial OpenPLC Editor** — criar projeto, montar programa, mapear
   pinos, configurar porta serial no Linux, transferir e depurar.
6. **Bordas, Set/Reset e Temporizadores** — contatos `P`/`N`, bobinas
   `S`/`R`, blocos `TON`/`TOF` e o tipo `TIME`.
7. **Variáveis no OpenPLC** — classes, tipos, endereçamento, exercício de
   entrada/saída analógica e conversão de valores.
8. **Termostato simulado** *(rascunho)* — projeto aplicando entrada
   analógica escalada, histerese com Set/Reset e um `TON` como bloqueio
   anti-curto-ciclo.
9. **Funções e Blocos de Função** *(prévia)* — diferença entre Function
   (sem memória) e Function Block (com instância e memória), exemplos
   `MOVE`/`SR`, e quando criar POUs próprios.
10. **Partida sequencial de 4 motores** *(rascunho)* — exercício aplicando
    a decisão Function × Function Block da aula 09: por que escalonar a
    partida de motores, e um Function Block próprio compondo `SR`,
    `R_TRIG` e três `TON` para sequenciar 4 saídas com atraso.

## Convenções

- Nomes de pasta e arquivo em `kebab-case`, sem acento.
- Prefixo numérico (`01-`, `02-`...) define a ordem de estudo.
- Cada aula é **autocontida** — não referencia as outras diretamente — mas
  segue uma progressão lógica quando lida em ordem.
