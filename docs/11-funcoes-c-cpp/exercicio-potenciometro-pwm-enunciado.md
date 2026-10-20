# Exercício: Potenciômetro no navegador, PWM no LED

> **Pré-requisito:** aula [Funções em C/C++ no OpenPLC](funcoes-c-cpp.md),
> em especial o **Nível 3** (seção 8) — o `server_ap` com página web que
> mostra uma entrada e aciona uma saída remotamente.

## Objetivo

Estenda o `server_ap` do nível 3 para trabalhar com **valores**, não só
com liga/desliga:

1. **Mostre, na página, o valor de um potenciômetro** ligado a uma
   entrada analógica do ESP32 (mesmo tipo de sinal das aulas 07/08:
   leitura bruta `WORD`, 0–65535).
2. **Ofereça, na própria página, um controle deslizante (slider)** que
   ajuste o brilho de um LED via PWM — reaproveitando o formulário
   `/pwm` esboçado na aula (seção 8, "Detalhes de HTML").

---

## O que já está pronto (reaproveite do nível 3)

- O padrão de "ponte" (`g_entrada`/`g_led_comando`) entre pinos e página
  — só que agora guardando um **número**, não um `bool`.
- O padrão de rota + redirecionamento 303.
- O `<meta refresh>` pra atualizar a leitura sozinha.

---

## Perguntas para te guiar (sem entregar a resposta)

1. O potenciômetro chega como leitura bruta 0–65535 (`WORD`). A página
   deveria mostrar esse número cru, ou convertido pra uma faixa mais
   legível (0–100%, por exemplo)? Onde essa conversão deveria acontecer —
   dentro do C++, ou em outro POU/rung do Ladder (lembre da aula 08)?
2. O `<input type="range">` do HTML tem sua própria faixa mín/máx,
   independente da faixa do pino. Que faixa faz mais sentido pro slider —
   0–255 (PWM clássico de 8 bits) ou 0–1023? Que conversão isso exige
   entre o valor recebido por `server.arg("valor")` e o valor final
   escrito no PWM?
3. No ESP32 (core 3.x, o mesmo usado na aula), a chamada mais simples pra
   gerar PWM é `analogWrite(pino, valor)`. Essa GPIO física deveria ser
   fixada dentro do próprio `server_ap`, ou receber o número do pino como
   mais um parâmetro `VAR_INPUT` vindo do `main`?
4. O padrão de ponte do nível 3 usava `bool` (`g_entrada`,
   `g_led_comando`). Que tipo C++ (`int`, `uint16_t`...) faz sentido pra
   guardar o valor do potenciômetro e o valor do PWM nessas variáveis
   globais-espelho?
5. Com o `<meta refresh>` de 2 segundos, o slider da página "pula" de
   volta pro valor atual a cada atualização — o que pode atrapalhar quem
   está arrastando o controle. Isso é um problema real pra este
   exercício, ou só um detalhe de polimento pra depois?

---

## Checklist de entrega

- [ ] `server_ap` estendido com entrada analógica (potenciômetro) e saída
      PWM.
- [ ] Página mostra o valor do potenciômetro (bruto ou convertido —
      decisão documentada).
- [ ] Slider na página ajusta o brilho do LED via PWM.
- [ ] Testado: girar o potenciômetro atualiza o valor mostrado (dentro do
      intervalo do refresh).
- [ ] Testado: mover o slider muda o brilho do LED de verdade.
- [ ] Capturas de tela da página funcionando, e do modo debug (se os
      pinos estiverem visíveis na tabela de variáveis).
