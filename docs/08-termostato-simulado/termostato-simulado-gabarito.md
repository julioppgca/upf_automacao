# Projeto: Termostato Simulado — Gabarito

> **Uso:** documento de referência para o professor conferir/corrigir o
> exercício. A versão que vai para o aluno é
> [termostato-simulado-enunciado.md](termostato-simulado-enunciado.md),
> sem o código-solução.
>
> **Status:** projeto de papel — ainda sem montagem física nem capturas
> de tela.

## 1. Objetivo

Simular um termostato de refrigeração (geladeira/climatizador): um
potenciômetro faz o papel de sensor de temperatura, e uma saída digital
(via módulo relé) faz o papel do **compressor**. O sistema:

- só liga/desliga o compressor quando **armado** — um botão alterna
  armado/desarmado a cada toque;
- **liga** o compressor quando a temperatura simulada sobe acima de um
  limite superior, e **desliga** quando cai abaixo de um limite inferior
  (histerese);
- **bloqueia o religamento** do compressor por um tempo mínimo depois de
  desligar (anti-curto-ciclo) — esse tempo mínimo é ajustado por um
  segundo potenciômetro, entre 500ms e 2s;
- indica em LEDs, com cores diferentes, se o sistema está armado e se o
  compressor está ligado.

> **Correção em relação à ideia original:** a primeira versão desta ideia
> dizia "liga <18°C, desliga >22°C" — isso é lógica de **aquecedor**, não
> de compressor. Um compressor de refrigeração faz o oposto: **liga
> quando está quente** (acima do limite superior) e **desliga quando está
> frio** (abaixo do limite inferior). Essa versão já corrige isso.

---

## 2. Conceitos envolvidos

- **Entrada analógica + conversão para unidade de engenharia** — duas
  vezes: temperatura simulada e tempo de bloqueio simulado.
- **Contato de borda + alternância de estado (toggle)** — um botão
  momentâneo controlando um estado que "lembra" se está ligado.
- **Histerese (banda morta)** via Set/Reset — evita liga/desliga
  compulsivo perto do limite.
- **`TON` com tempo variável** — o `PT` não precisa ser uma constante;
  pode vir de uma variável calculada.
- **Conversão de tipos explícita** (`REAL_TO_DINT`, `TO_TIME`).

---

## 3. Hardware e pinagem

| Papel | Componente | Pino | Endereço |
|---|---|---|---|
| Temperatura simulada | Potenciômetro 1 | GPIO34 (entrada analógica) | `%IW0` |
| Tempo de bloqueio simulado | Potenciômetro 2 | GPIO35 (entrada analógica) | `%IW1` |
| Botão arma/desarma | Botão pulsador (NA + pull-down 10kΩ) | GPIO23 (entrada digital) | `%IX0.0` |
| Compressor (relé) | Módulo relé isolado + carga | GPIO2 (saída digital) | `%QX0.0` |
| LED sistema armado | LED **verde** + resistor | GPIO4 (saída digital) | `%QX0.1` |
| LED compressor ligado | LED **vermelho** + resistor | GPIO16 (saída digital) | `%QX0.2` |

- GPIO34 e GPIO35 são pinos só-entrada com canal ADC — sem pull interno
  em hardware, mas não precisam (são analógicos, não digitais).
- GPIO23 precisa de pull-down externo (10kΩ) — sem isso o botão flutua.
- GPIO2 aciona um **módulo relé isolado**, nunca a carga diretamente.

---

## 4. Equivalência analógico → temperatura

`WORD` bruto (0–65535, ≈0–3,3V) → **0°C a 40°C**:

```
temperatura (°C) = analog_temp × (40,0 / 65535) ≈ analog_temp × 0,00061036
```

| Posição do potenciômetro | Tensão aprox. | `analog_temp` (bruto) | Temperatura simulada |
|---|---|---|---|
| Mínimo | 0,0 V | 0 | 0 °C |
| ~37% do curso | 1,49 V | ≈ 29491 | **18 °C** (limite de desligar) |
| ~45% do curso | 1,82 V | ≈ 36044 | **22 °C** (limite de ligar) |
| Máximo | 3,3 V | 65535 | 40 °C |

## 5. Equivalência analógico → tempo de bloqueio

`WORD` bruto (0–65535) → **500ms a 2000ms**:

```
tempo_bloqueio_ms = 500 + analog_tempo2 × (1500 / 65535)
```

| Posição do potenciômetro 2 | `analog_tempo2` (bruto) | Tempo de bloqueio |
|---|---|---|
| Mínimo | 0 | 500 ms |
| Meio-curso | ≈ 32768 | ≈ 1250 ms |
| Máximo | 65535 | 2000 ms |

---

## 6. Lógica de histerese

| Limiar | Valor | Ação |
|---|---|---|
| `T_LIGA` | 22 °C | temperatura ≥ 22°C **e** sistema armado **e** não bloqueado → liga |
| `T_DESLIGA` | 18 °C | temperatura ≤ 18°C **ou** sistema desarmado → desliga |
| *(banda morta)* | 18°C a 22°C | compressor mantém o estado atual |

Desarmar o sistema **força o compressor a desligar na hora**, independente
da temperatura — é tratado como uma condição de desliga adicional, não só
uma trava na condição de liga.

---

## 7. Arme/desarme por toque único (toggle)

Um botão só, alternando estado a cada aperto — usa borda de subida +
inversão:

```pascal
pulso_arme(CLK := botao_arme);
IF pulso_arme.Q THEN
    sistema_armado := NOT sistema_armado;
END_IF;
```

- Sem a borda, o `NOT` ficaria alternando a cada ciclo de scan enquanto o
  botão estivesse pressionado (várias vezes por segundo) — é a borda que
  garante **uma alternância por aperto**.

---

## 8. Anti-curto-ciclo com tempo ajustável

Mesmo truque de antes (`TON` com `IN := NOT compressor`), só que agora
`PT` vem de uma variável calculada a partir do potenciômetro 2:

```pascal
temp2             := analog_tempo2;                          (* WORD → REAL *)
tempo_bloqueio_ms := 500.0 + (temp2 * (1500.0 / 65535.0));    (* 500.0 .. 2000.0 *)
tempo_bloqueio_i  := REAL_TO_DINT(tempo_bloqueio_ms);         (* REAL → DINT *)
tempo_bloqueio    := TO_TIME(tempo_bloqueio_i);               (* DINT → TIME, em ms *)

bloqueio_religa(IN := NOT compressor, PT := tempo_bloqueio);
```

---

## 9. Programa completo (Structured Text)

```pascal
PROGRAM main
VAR
    (* entradas fisicas *)
    analog_temp     : WORD AT %IW0;      (* potenciometro 1: temperatura simulada *)
    analog_tempo2   : WORD AT %IW1;      (* potenciometro 2: tempo de bloqueio *)
    botao_arme      : BOOL AT %IX0.0;    (* botao liga/desliga o sistema *)

    (* saidas fisicas *)
    compressor      : BOOL AT %QX0.0;    (* rele do compressor *)
    led_armado      : BOOL AT %QX0.1;    (* LED verde *)
    led_compressor  : BOOL AT %QX0.2;    (* LED vermelho *)

    (* arme/desarme *)
    sistema_armado  : BOOL;
    pulso_arme      : R_TRIG;

    (* temperatura *)
    temp1           : REAL;
    temperatura     : REAL;
    temp_scale      : REAL := 0.00061036;  (* 40.0 / 65535 *)
    t_liga          : REAL := 22.0;
    t_desliga       : REAL := 18.0;

    (* tempo de bloqueio *)
    temp2             : REAL;
    tempo_bloqueio_ms : REAL;
    tempo_bloqueio_i  : DINT;
    tempo_bloqueio    : TIME;
    bloqueio_religa   : TON;
END_VAR

(* 1. arme/desarme por toque unico *)
pulso_arme(CLK := botao_arme);
IF pulso_arme.Q THEN
    sistema_armado := NOT sistema_armado;
END_IF;

(* 2. temperatura simulada *)
temp1       := analog_temp;
temperatura := temp1 * temp_scale;

(* 3. tempo de bloqueio simulado (500ms a 2000ms) *)
temp2             := analog_tempo2;
tempo_bloqueio_ms := 500.0 + (temp2 * (1500.0 / 65535.0));
tempo_bloqueio_i  := REAL_TO_DINT(tempo_bloqueio_ms);
tempo_bloqueio    := TO_TIME(tempo_bloqueio_i);

(* 4. bloqueio anti-curto-ciclo *)
bloqueio_religa(IN := NOT compressor, PT := tempo_bloqueio);

(* 5. histerese do compressor, só quando armado *)
IF sistema_armado AND (temperatura >= t_liga) AND bloqueio_religa.Q THEN
    compressor := TRUE;
END_IF;

IF (NOT sistema_armado) OR (temperatura <= t_desliga) THEN
    compressor := FALSE;
END_IF;

(* 6. LEDs de indicação *)
led_armado     := sistema_armado;
led_compressor := compressor;

END_PROGRAM
```

---

## 10. Roteiro de testes em bancada

1. Aperte o botão de arme — `led_armado` (verde) deve acender.
2. Com o potenciômetro 1 no mínimo, confirme que o compressor está
   desligado.
3. Gire o potenciômetro 1 até passar de ~22°C — compressor e
   `led_compressor` (vermelho) devem ligar.
4. Volte para dentro da banda morta (ex.: 20°C) — compressor continua
   ligado.
5. Gire abaixo de 18°C — compressor desliga.
6. Rapidamente, gire de novo acima de 22°C — o compressor **não** deve
   religar até o tempo de bloqueio (definido pelo potenciômetro 2)
   terminar — acompanhar `ET` do `bloqueio_religa` em modo debug.
7. Aperte o botão de arme de novo — sistema desarma, `led_armado` apaga,
   e o compressor desliga **na hora**, mesmo que a temperatura simulada
   ainda esteja alta.
8. Gire o potenciômetro 2 para o mínimo (500ms) e repita o teste 6 —
   o bloqueio deve durar bem menos tempo.

---

## 11. Próximos passos

- [ ] Montar o circuito físico e registrar o diagrama de ligação real.
- [ ] Capturar telas do projeto no OpenPLC Editor (variáveis, rungs,
      Pin Mapping).
- [ ] Testar com o bloco `SCALE` no lugar da conversão manual (nas duas
      entradas analógicas) e comparar.
- [ ] Rodar o roteiro de testes da seção 10 e registrar os resultados
      (com prints do modo debug).
- [ ] Criar o `quadro-resumo.md` depois que a lógica estiver validada na
      bancada.
