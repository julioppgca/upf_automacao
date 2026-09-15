# Quadro-resumo — Bordas, Set/Reset e Temporizadores

> Versão condensada para apresentar no quadro. Aula completa: [bordas-set-reset-temporizadores.md](bordas-set-reset-temporizadores.md)

## Contatos de borda

| Contato | Dispara em | Duração |
|---|---|---|
| `P` (Rising Edge) | transição 0→1 | 1 ciclo de scan |
| `N` (Falling Edge) | transição 1→0 | 1 ciclo de scan |

```pascal
R_TRIG1(CLK := A); pulso_subida := R_TRIG1.Q;
F_TRIG1(CLK := A); pulso_descida := F_TRIG1.Q;
```

## Bobinas Set (S) / Reset (R)

- `-(S)-` liga e **trava** em 1 até um Reset.
- `-(R)-` desliga e **trava** em 0 até um Set.
- Empate no mesmo scan → vence **quem for resolvido por último** na
  ordem dos rungs ("Reset dominante" se vier depois).

```pascal
IF liga    THEN motor := TRUE;  END_IF;
IF desliga THEN motor := FALSE; END_IF;   (* dominante, vem depois *)
```

## Temporizadores TON / TOF

| Pino | Tipo | Significado |
|---|---|---|
| `IN` | BOOL | dispara o timer |
| `PT` | **TIME** | tempo programado (`T#2s`, `T#500ms`) |
| `Q` | BOOL | saída |
| `ET` | TIME | tempo decorrido |

- **TON**: atrasa o **1** (liga com atraso, desliga na hora).
- **TOF**: atrasa o **0** (liga na hora, desliga com atraso).

```pascal
TON_1(IN := start, PT := T#5s); motor := TON_1.Q;
TOF_1(IN := sensor, PT := T#10s); luz := TOF_1.Q;
```
