# Quadro-resumo — Funções em C/C++ no OpenPLC

> Versão condensada para apresentar no quadro. Aula completa: [funcoes-c-cpp.md](funcoes-c-cpp.md)

## Por que sair da norma IEC 61131-3?

- ST/Ladder/FBD/IL/SFC não têm acesso a Wi-Fi, flash, bibliotecas de
  sensores etc.
- Por baixo do runtime do OpenPLC no ESP32 existe um ambiente
  Arduino/ESP-IDF completo — um POU em **C/C++** acessa isso direto.

## Como funciona

| Função especial | Quando roda |
|---|---|
| `setup()` | uma única vez, na 1ª varredura da instância |
| `loop()` | toda varredura, a partir daí |

**Sempre Function Block** — guarda estado entre varreduras (mesmo que
escondido em variáveis globais/`static` do C++, não em `VAR_OUTPUT`).

Pinos (`VAR_INPUT`/`VAR_OUTPUT`) viram um `#define <pino> (*(vars->PINO))`
por pino — use o **nome direto**, nunca `vars->pino`.

## Primeiro exemplo: `pisca_c` (roda no simulador)

| Parte | No `pisca_c` |
|---|---|
| Pinos | `habilita` (Input BOOL), `saida` (Output BOOL) |
| Memória | globais `estado`, `ultima_troca` (uma só para todas as instâncias!) |
| `setup()` | `ultima_troca = millis();` |
| `loop()` | se passou 500 ms: `estado = !estado`; sempre: `saida = estado` |
| No `main` | `botao` (%IX0.0) → `PISCA_C0` → `led` (%QX0.0) |

- Esperar tempo = **`millis()`**, nunca `delay()` (o `delay` congela a
  varredura inteira).
- Testa sem placa: placa **OpenPLC Simulator** → ▶ → *Force True* no
  `botao` → gráfico do debugger mostra a onda quadrada.

## Os três níveis do exemplo `server_ap`

| Nível | O que tem | Pinos |
|---|---|---|
| 1 — simples | Sobe o Access Point (`192.168.4.1`), serve uma página estática | nenhum |
| 2 — com Ladder | Mesmo AP, mais `entrada`/`led_saida` ligados ao `main` | `entrada` (in), `led_saida` (out) |
| 3 — painel web | Página mostra `entrada` ao vivo e tem botões que ligam/desligam `led_saida` remotamente | mesmos, + ponte via globais (`g_entrada`/`g_led_comando`) |

- O AP **nunca** deve depender de um pino pra subir — sem ele no ar, não
  dá pra alcançar a página pra controlar esse pino (paradoxo do ovo e da
  galinha).
- Rotas do `WebServer` (`handleRoot`...) **não recebem `vars`** — só
  `setup()`/`loop()`. `loop()` precisa copiar pino ↔ variável global a
  cada varredura pra ponte funcionar.

## HTML: como a página conversa com o C++

| Mecanismo | Pra quê |
|---|---|
| `server.on(caminho, funcao)` | registra uma rota |
| `<a href="/rota">` | botão liga/desliga — `GET` simples, sem valor |
| `server.send(303)` + `Location` | redireciona de volta pra `/` depois de agir |
| `<meta http-equiv="refresh" content="2">` | recarrega a página sozinha, sem JS |
| `<form method="GET"><input type="range" name="valor">` | manda um **valor**, não só um comando |
| `server.arg("valor").toInt()` | lê esse valor no C++ |

## Travamento silencioso — o maior risco

- `delay()`/laço infinito dentro de `loop()` trava a varredura
  **inteira** do CLP, sem nenhum erro visível no Editor.

## Debug: `printf`/`Serial.print` num terminal separado

- **`printf` derruba o debugger do Editor**: os dois usam a mesma
  `Serial` a 115200 (Modbus RTU). Ou debug pelo Editor (sem `printf`), ou
  pelo terminal serial (Editor desconectado).

- Nada disso aparece no OpenPLC Editor — é preciso um terminal serial
  à parte (ex.: **Serial Monitor do VS Code**), na mesma porta e no
  mesmo baud rate do `Serial.begin(...)`.
- Só um programa pode segurar a porta serial por vez — feche a
  ferramenta de gravação antes de abrir o monitor.

## Exercício proposto

Estender o nível 3 pra trocar `bool` por **valor**: mostrar a leitura de
um potenciômetro (`WORD`, 0–65535) na página, e um slider na página
ajustando um PWM (`analogWrite`) que controla o brilho de um LED.
Enunciado completo: [exercicio-potenciometro-pwm-enunciado.md](exercicio-potenciometro-pwm-enunciado.md).
