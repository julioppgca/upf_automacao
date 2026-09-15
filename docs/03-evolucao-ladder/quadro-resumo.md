# Quadro-resumo — Evolução do Ladder

> Versão condensada para apresentar no quadro. Aula completa: [evolucao-ladder.md](evolucao-ladder.md)

## A ideia central

```
Contato elétrico  →  Porta lógica (Boole)  →  Ladder (CLP)
```

As três formas descrevem a **mesma coisa** — só muda a representação.

## Linha do tempo

Boole (álgebra) → relés → Shannon (1937, chaveamento = booleano) →
1968: GM pede substituto pros painéis de relé → nasce o CLP → 1993: IEC 61131-3

## As três equivalências

| Circuito elétrico | Porta lógica | Ladder |
|---|---|---|
| Contatos em **série** | **AND** (`·`) | contatos em sequência no rung |
| Contatos em **paralelo** | **OR** (`+`) | ramos paralelos no rung |
| Contato **NF** | **NOT** (`¬`) | trocar NA por NF |

## Regra de bolso

- "**Série pensa como E**"
- "**Paralelo pensa como OU**"

## Exemplo combinado (selo Start/Stop)

```
Q0.0 := (I0.0 OR Q0.0) AND NOT I0.1;
        \____ OU ____/      \_NÃO_/
              \___________ E ___________/
```
