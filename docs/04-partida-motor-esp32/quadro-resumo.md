# Quadro-resumo — Partida de Motor com ESP32

> Versão condensada para apresentar no quadro. Aula completa: [partida-motor-esp32.md](partida-motor-esp32.md)

## Pinagem usada

| Sinal | GPIO | Endereço |
|---|---|---|
| Start | GPIO23 | `%IX0.0` |
| Stop | GPIO22 | `%IX0.1` |
| Motor (relé) | GPIO2 | `%QX0.0` |

## Pull-up/down: obrigatório — por quê

- Firmware do OpenPLC usa `pinMode(pin, INPUT)` **puro** — não liga pull
  interno nenhum.
- Sem resistor externo, o pino fica **flutuando** e lê ruído.
- GPIO 34/35/36(VP)/39(VN): **nunca** têm pull interno em hardware.

## Ligação recomendada (pull-down)

```
3V3 —[botão]— pino GPIO —[10kΩ]— GND
```

- Repouso → `0V` → lê `0`
- Pressionado → `3.3V` → lê `1`

## Regra de ouro do circuito de potência

```
GPIO → módulo relé ISOLADO → bobina do contator → contatos do contator → motor
```

- O ESP32 **nunca** encosta na tensão/corrente do motor.
- Sempre com disjuntor + relé térmico de proteção.

## Checklist antes de energizar

- [ ] Testar botões com multímetro antes de ligar o motor
- [ ] GPIO nunca ligada direto na bobina do contator
- [ ] Disjuntor/relé térmico dimensionados
- [ ] Fiação de potência separada da fiação de lógica
- [ ] Testar Stop antes de testar Start
