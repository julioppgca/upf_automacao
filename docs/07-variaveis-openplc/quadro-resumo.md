# Quadro-resumo — Variáveis no OpenPLC

> Versão condensada para apresentar no quadro. Aula completa: [variaveis-openplc.md](variaveis-openplc.md)

## Tabela de variáveis

`Name` + `Type` são obrigatórios. `Class`, `Location`, `Initial Value` e
`Documentation` são opcionais.

## Tipos mais usados

| Tipo | Uso |
|---|---|
| `BOOL` | E/S digital |
| `WORD` | E/S analógica bruta (0–65535) |
| `REAL` | cálculo em unidade de engenharia (V, °C...) |
| `TIME` | duração (`T#...`), usado em timers |
| `STRING` | texto |

## Endereçamento direto

```
%<I|Q|M><X|W><posição>
```

- `%IX0.0` → 1 bit de entrada · `%IW0` → 1 palavra de entrada (canal analógico)

## Analógico bruto → volts

```pascal
temp1    := analog_in;          (* WORD → REAL, via MOVE *)
volts_in := temp1 * adc_scale;  (* adc_scale ≈ 3.3V / 65535 *)
```

## Funções de conversão explícita

`TO_REAL`, `TO_TIME`, `TO_STRING`, `TO_INT`... — família `TO_<tipo>`.

```pascal
tempo := TO_TIME(analog_in);   (* ex.: potenciômetro define o PT de um TON *)
```

## Exercício proposto

Pesquisar a função **`SCALE`** na biblioteca do OpenPLC e refazer a
conversão analógico→volts com ela, sem precisar declarar `adc_scale` na
mão.
