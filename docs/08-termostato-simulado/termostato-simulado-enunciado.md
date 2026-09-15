# Projeto: Termostato Simulado

## Objetivo

Montar e programar, no ESP32 + OpenPLC, um **termostato de refrigeração
simulado**: um potenciômetro faz o papel de sensor de temperatura, e um
relé faz o papel do compressor de uma geladeira/climatizador.

---

## Hardware

| Papel | Componente | Pino | Endereço |
|---|---|---|---|
| Temperatura simulada | Potenciômetro 1 | GPIO34 (entrada analógica) | `%IW0` |
| Tempo de bloqueio simulado | Potenciômetro 2 | GPIO35 (entrada analógica) | `%IW1` |
| Botão de arme/desarme | Botão pulsador (NA + pull-down 10kΩ) | GPIO23 (entrada digital) | `%IX0.0` |
| Compressor | Módulo relé isolado + carga | GPIO2 (saída digital) | `%QX0.0` |
| LED sistema armado | LED **verde** + resistor | GPIO4 (saída digital) | `%QX0.1` |
| LED compressor ligado | LED **vermelho** + resistor | GPIO16 (saída digital) | `%QX0.2` |

> Lembre-se: GPIO23 precisa de resistor de pull-down externo — sem ele o
> botão fica flutuando. E o ESP32 nunca aciona o relé (nem qualquer
> carga) diretamente sem passar por um módulo isolado.

---

## O que o sistema precisa fazer

### 1. Armar/desarmar

- Um único botão. **Um toque arma** o sistema, **o próximo toque
  desarma**. Não é botão de segurar — é de tocar e soltar.
- O LED verde (`led_armado`) fica aceso enquanto o sistema estiver
  armado, apagado quando desarmado.
- **Desarmar desliga o compressor na hora**, não importa a temperatura.

### 2. Equivalência entre o potenciômetro 1 e a temperatura

O potenciômetro 1 deve representar uma faixa de temperatura de **0°C a
40°C**, sendo `0V ≈ 0°C` e `3,3V ≈ 40°C` (linear).

| Posição | Tensão aprox. | Temperatura simulada |
|---|---|---|
| Mínimo | 0,0 V | 0 °C |
| ~37% do curso | 1,49 V | 18 °C |
| ~45% do curso | 1,82 V | 22 °C |
| Máximo | 3,3 V | 40 °C |

### 3. Controle do compressor (com histerese)

- Sistema armado **e** temperatura simulada **≥ 22°C** → compressor liga.
- Temperatura simulada **≤ 18°C** (ou sistema desarmado) → compressor
  desliga.
- Entre 18°C e 22°C, o compressor **mantém** o estado em que já estava
  (não faz nada nessa faixa).
- O LED vermelho (`led_compressor`) reflete o estado do compressor.

### 4. Bloqueio anti-curto-ciclo, com tempo ajustável

- Depois que o compressor desliga, ele **não pode religar** antes de um
  tempo mínimo — mesmo que a temperatura já esteja pedindo pra ligar de
  novo.
- Esse tempo mínimo é definido pelo **potenciômetro 2**, numa faixa de
  **500ms (mínimo) a 2000ms/2s (máximo)**.
- O tempo de bloqueio só conta enquanto o compressor estiver desligado
  **sem interrupção** — se ele ligar antes do fim do bloqueio (o que não
  deveria acontecer se a lógica estiver certa), o contador zera.

---

## Perguntas para te guiar (sem entregar a resposta)

1. Um botão que alterna entre dois estados a cada toque — que tipo de
   contato você já viu que dispara só **uma vez** por evento, mesmo que o
   botão fique pressionado? Como combinar isso com uma inversão de
   estado?
2. Como transformar um valor `WORD` bruto (0–65535) numa faixa de
   temperatura em °C? E numa faixa de milissegundos (500–2000), que é
   uma faixa diferente da anterior?
3. Que bloco de conversão transforma um número inteiro de milissegundos
   num valor do tipo `TIME`, para usar como `PT` de um temporizador?
4. Um `TON` sempre precisa ter `PT` como uma constante fixa (`T#2s`), ou
   pode ser uma variável calculada?
5. Pense na condição de **desarmar**: ela deveria só impedir o compressor
   de ligar, ou deveria também forçar ele a desligar imediatamente?

---

## Checklist de entrega

- [ ] Circuito montado (fotos ou diagrama).
- [ ] Projeto no OpenPLC Editor com as variáveis, pinagem e lógica.
- [ ] Testado: arme/desarme por toque único funcionando.
- [ ] Testado: histerese (compressor não fica ligando/desligando dentro
      da banda morta 18–22°C).
- [ ] Testado: bloqueio anti-curto-ciclo respeitando o tempo do
      potenciômetro 2 (testar no mínimo e no máximo da faixa).
- [ ] Testado: desarmar desliga o compressor na hora.
- [ ] Capturas de tela do modo debug mostrando pelo menos uma transição
      de estado (compressor ligando ou desligando) com os valores das
      variáveis visíveis.
