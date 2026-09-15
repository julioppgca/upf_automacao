# Quadro-resumo — Linguagem Ladder

> Versão condensada para apresentar no quadro. Aula completa: [linguagem-ladder.md](linguagem-ladder.md)

## Elementos básicos

| Símbolo | Nome | Regra |
|---|---|---|
| `—\| \|—` | Contato NA | conduz se variável = 1 |
| `—\|/\|—` | Contato NF | conduz se variável = 0 |
| `—( )—` | Bobina | = ao estado do rung |
| `—(S)—` | Bobina Set | liga e trava em 1 |
| `—(R)—` | Bobina Reset | desliga e trava em 0 |

## Operações básicas — Ladder × ST

| Operação | ST |
|---|---|
| Cópia | `S := A;` |
| AND | `S := A AND B;` |
| OR | `S := A OR B;` |
| NOT | `S := NOT A;` |
| NAND | `S := NOT (A AND B);` |
| NOR | `S := NOT (A OR B);` |
| XOR | `S := A XOR B;` |
| XNOR | `S := NOT (A XOR B);` |

## Circuito de selo (Start/Stop)

```
Q0.0 := (I0.0 OR Q0.0) AND NOT I0.1;
```

## As 5 linguagens da IEC 61131-3

| Sigla | Nome | Tipo | Melhor uso |
|---|---|---|---|
| LD | Ladder Diagram | Gráfica | intertravamentos |
| FBD | Function Block Diagram | Gráfica | malhas de controle, blocos |
| SFC | Sequential Function Chart | Gráfica (estrutura) | processos sequenciais |
| ST | Structured Text | Textual | cálculos, lógica complexa |
| IL | Instruction List | Textual (removida na 3ª ed.) | uso legado |
