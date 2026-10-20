# Gabarito: dois ESP32 conversando por luz

> Material do professor. Enunciado:
> [laboratorio-optoacoplador-enunciado.md](laboratorio-optoacoplador-enunciado.md).

## Parte 1 — cálculo

| Grandeza | Típico | Pior caso |
|---|---|---|
| I_F com 330 Ω | (3,3 − 1,1)/330 = **6,7 mA** | (2,64 − 1,4)/330 = **3,8 mA** |
| I_C necessária (pull-down 10 kΩ) | (3,3 − 0,2)/10 k = **0,31 mA** | — |
| CTR mínimo necessário | — | 0,31 / 3,8 = **8 %** |
| CTR garantido (PC817, I_F = 5 mA) | 50 % | 50 % |

Folga de cerca de 6× sobre o CTR mínimo. Mesmo com o CTR caindo pela
metade por temperatura e envelhecimento (Fig. 9 do datasheet), sobram
cerca de 3×.

## Parte 2 — valores esperados

| Medida | S1 solto | S1 apertado |
|---|---|---|
| V em R1 | 0 V | ~2,1–2,3 V → I_F ≈ 6,5–7 mA |
| GPIO22 do B × GND B | ~0 V (fuga ≤ 1 mV) | ~3,0–3,2 V |
| GPIO22 do B × GND A | indefinido, deriva, pode marcar qualquer coisa | idem |

A última linha não tem referência: o multímetro mede a diferença entre dois
circuitos que **não estão ligados**, e o que aparece é só o efeito da
capacitância parasita e da própria impedância do multímetro. Isso
**mostra** a isolação.

## Parte 3 — programa (igual nos dois)

```
botao ──| |──────────( ) tx
rx    ──| |──────────( ) led_rx
```

Em ST:

```pascal
tx     := botao;
led_rx := rx;
```

Erros mais comuns:

- **Opto girado errado**: o pino 1 tem uma marca (bolinha). Invertido, o
  LED fica polarizado ao contrário e nada acontece. O V_R máximo é 6 V,
  então não queima com 3,3 V.
- **Sem pull-down no GPIO22**: com o opto desligado o pino flutua e o
  `rx` pisca sozinho (aula 04).
- **U2 não foi girado** na protoboard: os dois lados de U2 ficam trocados
  em relação às metades A/B, e o aluno acaba ligando o 3V3 de um lado no
  LED do outro.
- **Ponte entre as trilhas de alimentação** de cima e de baixo da
  protoboard: o circuito funciona, mas a medida de OL do passo 3.2 falha.

## Parte 4 — eco e selo

1. Com `tx := rx` no B, apertar S1 no A acende o LED1 do **próprio** A: o
   sinal vai por U1, o B devolve por U2 e volta. É uma **confirmação**: o
   A sabe que o B recebeu, e que os dois caminhos e o programa do B estão
   funcionando. É o mesmo princípio de um *handshake*/ACK.
2. Com `tx := botao OR rx` nos dois, basta um toque em qualquer botão
   para os dois `tx` ficarem **ligados para sempre**. A liga U1 → B
   recebe e liga o próprio `tx` → U2 → A recebe e mantém o `tx` dele,
   mesmo sem botão. É o **selo** (contato de selo da partida de motor,
   aulas 02/04), só que fechado através de dois CLPs e da luz. Só sai
   desse estado se a alimentação for cortada ou se um dos programas for
   regravado.
3. Qualquer solução que abra o anel serve. Por exemplo, um "desliga" em um
   dos lados:
   - no B: `tx := (botao OR rx) AND NOT desliga`, com um segundo botão; ou
   - um `TOF`/`TON` que derruba o `tx` depois de um tempo sem botão
     (`tx := botao OR (rx AND NOT tempo_esgotado)`).

## Parte 5 — GND pela USB

| Situação | Resistência GND A × GND B |
|---|---|
| B no power bank | **OL** (aberto) |
| A e B na USB do mesmo computador | **~0 Ω** (o GND da USB é comum dentro do PC) |

O circuito funciona nos dois casos, porque o opto não precisa de GND
separado para funcionar. Mas no segundo caso **não há isolação nenhuma**:
um defeito num lado chegaria ao outro (e ao computador) pelo GND da USB. É
exatamente o que acontece num painel quando o "0 V" da fonte de 24 V é
ligado ao GND do microcontrolador: o opto continua lá, mas não isola mais.

## Desafio — contar pulsos

**ESP32 A** (pisca enquanto S1 está apertado):

```pascal
PROGRAM main
  VAR
    botao  : BOOL AT %IX0.0;
    rx     : BOOL AT %IX0.1;
    tx     : BOOL AT %QX0.0;
    led_rx : BOOL AT %QX0.1;
    t_lig, t_desl : TON;
    osc    : BOOL;
  END_VAR
  t_lig (IN := botao AND NOT osc, PT := T#200ms);
  t_desl(IN := botao AND osc,     PT := T#200ms);
  IF t_lig.Q THEN osc := TRUE; END_IF;
  IF t_desl.Q OR NOT botao THEN osc := FALSE; END_IF;
  tx := osc;
  led_rx := rx;
END_PROGRAM
```

**ESP32 B** (conta 5 bordas de subida; S2 zera):

```pascal
PROGRAM main
  VAR
    botao  : BOOL AT %IX0.0;
    rx     : BOOL AT %IX0.1;
    tx     : BOOL AT %QX0.0;
    led_rx : BOOL AT %QX0.1;
    borda  : R_TRIG;
    cont   : CTU;
  END_VAR
  borda(CLK := rx);
  cont(CU := borda.Q, R := botao, PV := 5);
  led_rx := cont.Q;
  tx := rx;              (* opcional: eco para o A ver os pulsos voltando *)
END_PROGRAM
```

**Frequência máxima.** O opto **não** é o limite. Com R_L = 10 kΩ, a
subida e a descida levam algumas dezenas de µs (Fig. 13 do PC817), o que
permitiria alguns kHz. Quem limita é a **varredura** do OpenPLC
(`T#20ms`), nos dois lados:

- o B só vê um nível se ele durar **pelo menos uma varredura dele**, e as
  duas varreduras não estão sincronizadas;
- o próprio A só consegue mudar o `tx` uma vez a cada 20 ms.

Na prática, cada nível precisa durar **≥ 2 varreduras (40 ms)** para ser
visto sempre, o que dá **≤ ~12 pulsos por segundo**. Com 20 ms ligado e
20 ms desligado, os pulsos começam a ser perdidos ou contados de forma
irregular. Com 10 ms o A nem consegue gerar o pulso, porque o `TON` de
10 ms vence dentro de uma única varredura de 20 ms. Para contar mais
rápido seria preciso reduzir o período da tarefa ou usar uma interrupção
ou contador de hardware (em C/C++, aula 11).

## Perguntas

1. 330 Ω dá ~6,7 mA (dentro dos limites do LED e do GPIO, com folga de
   CTR). Com 10 kΩ: (3,3 − 1,0)/10 k = 0,23 mA, e com CTR de 50 % o
   transistor conduziria só ~0,12 mA, menos que os 0,31 mA necessários: o
   GPIO não chega ao nível 1. **Sem resistor**, o LED (~1,1 V) ligado
   direto num pino de 3,3 V puxaria toda a corrente que o GPIO conseguisse
   fornecer (dezenas de mA). O único limite seria a resistência interna do
   pino: muito acima do recomendado para o GPIO e perto do máximo
   absoluto do LED (50 mA).
2. Não existe caminho de corrente entre GND A e GND B: a tensão entre eles
   é **indefinida** (flutua). O multímetro mostra só o efeito de
   capacitâncias e da própria impedância de entrada.
3. A protoboard: o canal central tem poucos milímetros, e as trilhas e
   jumpers ficam lado a lado. A isolação de 5 kV vale para o componente;
   numa placa de verdade ela depende da distância de isolação (*creepage*)
   entre as trilhas dos dois lados.
4. Não seriam desnecessários. Exemplos: proteger contra surtos e ruído em
   cabos longos; evitar laços de terra entre equipamentos com fontes
   diferentes; separar o lado de força (inversor, motor) do lado de
   controle; garantir que um defeito no campo não destrua o CLP nem o
   computador ligado nele.
5. Para entrar no modo de gravação, o GPIO2 precisa estar em 0 ou solto. O
   LED do opto com 330 Ω para o GND age como um pull-down, ou seja,
   ajuda. Não usar o **GPIO12** (*strapping* da tensão da flash: em 1 no
   boot, o ESP32 pode nem iniciar) nem o GPIO0/GPIO15/GPIO5, que também
   são de *strapping*.
