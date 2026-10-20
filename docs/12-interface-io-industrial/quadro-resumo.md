# Quadro-resumo — Interface de E/S industrial com o ESP32

> Versão condensada para o quadro. Aula completa:
> [interface-io-industrial.md](interface-io-industrial.md)

## Limites do ESP32 (datasheet Espressif v5.3)

| | Valor |
|---|---|
| Máx. num pino | 3,6 V |
| Lê 1 / lê 0 | ≥ 2,475 V / ≤ 0,825 V |
| Saída em 1 (pior caso) | 2,64 V |
| Corrente por GPIO | ~29–40 mA (fornecer), 28 mA (absorver) |

## Sink × source

- **PNP** chaveia o +24 V (*source*) → liga em entrada **sink**.
- **NPN** chaveia o 0 V (*sink*) → liga em entrada **source**.
- Fios: marrom +24 V, azul 0 V, preto saída.

## Entrada 24 V (IEC 61131-2 tipo 3)

- 0: −3…5 V · 1: 11…30 V, 2…15 mA.
- PC817 + R1 3,3 kΩ 0,5 W + R2 680 Ω (limiar ~6 V) + 1N4148 (polaridade).

## Optoacoplador PC817 (Sharp)

| | |
|---|---|
| CTR | 50…600 % com I_F = 5 mA → projetar com 50 % e folga de 2–3× |
| I_F máx. / V_R máx. | 50 mA / 6 V |
| Isolação | 5 kV rms |
| Cálculo | I_F = (V_OH − V_F)/R; I_C ≤ CTR·I_F; GPIO lê 1 se I_C ≥ 3,3 V/R_pull |

## Entrada 220 VCA (H11AA1)

- 2 × 15 kΩ 2 W → I_pico ≈ 11 mA, P ≈ 2 W.
- LED apaga 120×/s → C de 1 µF na saída **ou** `TOF` de 30 ms no Ladder.

## Saídas

| Tipo | Regra de ouro |
|---|---|
| Relé SRD-05 (71 mA) | transistor + **diodo de roda-livre**; contato form C = 7 A 240 VCA, 3 A indutivo |
| Transistor 24 V | opto + transistor; β forçado = 10 |
| SSR G3MB-202P | deve operar com **≥ 4 V** (não direto no GPIO); só CA; fuga 1,5 mA; esquenta (1,6 V) |
| MOC3043 + triac | I_FT ≤ 5 mA → 180 Ω direto no GPIO; snubber 39 Ω + 10 nF |

## Analógico

| Sinal | Circuito | No ADC |
|---|---|---|
| 0–10 V | divisor 33 k / 10 k + 100 nF + grampo | 0–2,33 V |
| 4–20 mA | shunt 100 Ω 0,1 % | 0,40–2,00 V (< 0,36 V = fio rompido) |
| saída 0–10 V | DAC (GPIO25) → LM358 ganho 3, alimentado com 15–24 V | — |

- Faixa útil do ADC (11 dB): **0,15–2,45 V**, ±60 mV calibrado; use o ADC1.

## Isolação de verdade

- Cada lado da barreira tem a **própria fonte**.
- Duas placas na USB do mesmo PC **já têm GND comum**.

## Laboratório

Dois ESP32, 2× PC817, sem GND comum: botão de um acende o LED do outro.
[Enunciado](laboratorio-optoacoplador-enunciado.md).
