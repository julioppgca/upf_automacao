FUNCTION_BLOCK pisca_c
  VAR_INPUT
    habilita : BOOL;
  END_VAR
  VAR_OUTPUT
    saida : BOOL;
  END_VAR

/* ================================================================
 *  pisca_c - pisca-pisca escrito em C/C++
 *
 *  habilita (entrada): TRUE = pisca / FALSE = saida desligada
 *  saida    (saida)  : alterna a cada MEIO_PERIODO_MS milissegundos
 * ================================================================ */

#include <Arduino.h>

const unsigned long MEIO_PERIODO_MS = 500;  // tempo ligado = tempo desligado

unsigned long ultima_troca = 0;   // instante (ms) da ultima troca da saida
bool estado = false;              // estado atual do pisca

// Roda UMA vez, na primeira varredura
void setup()
{
    ultima_troca = millis();
}

// Roda a CADA varredura (aqui, a cada 20 ms)
void loop()
{
    if (!habilita)
    {
        estado = false;                        // desabilitado: saida apagada
    }
    else if (millis() - ultima_troca >= MEIO_PERIODO_MS)
    {
        estado = !estado;                      // passou meio periodo: inverte
        ultima_troca = millis();
    }

    saida = estado;                            // escreve no pino de saida
}


END_FUNCTION_BLOCK