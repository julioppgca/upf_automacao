# Quadro-resumo — Funções e Blocos de Função

> Versão condensada para apresentar no quadro. Aula completa: [funcoes.md](funcoes.md)

## Function × Function Block

| Aspecto | Function | Function Block |
|---|---|---|
| Guarda estado entre ciclos? | Não | **Sim** (na instância) |
| Precisa de instância nomeada? | Não | Sim (`TON0`, `SR0`...) |
| Nº de saídas de dado | 1 (+ `ENO`) | pode ter várias |
| Mesma entrada = mesma saída sempre? | Sim | não necessariamente |

## Exemplos

| Já conhecidos | São... |
|---|---|
| `MOVE`, `ADD`, `GT` | **Function** |
| `TON`, `TOF`, `SR`, `R_TRIG` | **Function Block** |

## Structured Text

```pascal
(* Function: sem instância *)
aout0 := ain0;              (* MOVE por trás do := *)

(* Function Block: com instância *)
SR0(S1 := liga, R := desliga);
saida := SR0.Q1;
```

## Regra prática

- Cálculo/comparação **sem memória** → **Function** própria.
- Lógica que precisa **lembrar algo** entre ciclos (tempo, contagem,
  estado anterior) → **Function Block** próprio.

## Linguagem é por POU, não pelo projeto

- `meu_move` (Function) → escrita em **Instruction List**.
- `meu_contador` (Function Block) → escrito em **Ladder**, chamando
  `meu_move` por dentro.
- `main` → também em **Ladder**, chamando `meu_contador` duas vezes
  (`MEU_CONTADOR0`, `MEU_CONTADOR1`) com memórias independentes.
- **A linguagem escolhida ao criar o POU não precisa ser a mesma de quem
  o chama.**
