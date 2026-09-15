# Quadro-resumo — Introdução ao CLP

> Versão condensada para apresentar no quadro. Aula completa: [introducao-clp.md](introducao-clp.md)

## Ideia central

**CLP = Entradas + Programa + Saídas**, repetido em loop, o tempo todo.

- Sem programa carregado → **nenhuma saída liga sozinha**.
- Quem decide o que fazer é sempre o programa, nunca o hardware sozinho.

## Arquitetura básica

```
Sensores → [ENTRADAS %I] → [CPU: programa] → [SAÍDAS %Q] → Atuadores
                                 ↑
                          Fonte de alimentação
```

## Tipos de E/S

| Tipo | Sinal | Exemplo |
|---|---|---|
| Entrada digital | 0/24VDC | botão, chave fim-de-curso |
| Entrada analógica | 4-20mA, 0-10V | sensor de temperatura/pressão |
| Saída digital | relé/transistor | contator, lâmpada |
| Saída analógica | 0-10V, 4-20mA | inversor, válvula proporcional |

## Ciclo de varredura (scan cycle)

```
1. Lê entradas → 2. Executa o programa → 3. Atualiza saídas → (repete, ex.: 20ms)
```

## CLP × Microcontrolador

- Um CLP normalmente **é** um microcontrolador por dentro.
- + E/S industrial isolada + firmware de tempo real + invólucro robusto +
  linguagens **IEC 61131-3** = o produto vira um CLP.
- Diferença prática: robustez de hardware + determinismo + linguagens
  padronizadas.
