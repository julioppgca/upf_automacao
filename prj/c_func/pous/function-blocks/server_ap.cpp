FUNCTION_BLOCK server_ap
  VAR_INPUT
    entrada : BOOL := false;
  END_VAR
  VAR_OUTPUT
    led_saida : BOOL := false;
  END_VAR
#include <Arduino.h>
#include <WiFi.h>
#include <WebServer.h>

const char* ap_ssid     = "ESP32-OpenPLC";
const char* ap_password = "openplc123";

WebServer server(80);

// Copias em variaveis globais "normais" - handleRoot()/handleLedOn()/
// handleLedOff() sao chamadas pelo WebServer com a assinatura void(),
// SEM o ponteiro "vars", entao NAO enxergam os pinos (que so existem
// via o #define que aponta pra vars->...). Só loop() (que vira
// server_ap_loop(vars)) tem "vars" no escopo. Por isso loop() copia o
// pino de entrada pra uma global a cada varredura, e a pagina web só
// le/escreve nessas globais - nunca nos pinos diretamente.
bool g_entrada     = false;   // espelho do pino de entrada, pra pagina mostrar
bool g_led_comando = false;   // estado pedido pela pagina, pro loop() escrever no pino

String pagina_html()
{
    String html;
    html += "<!DOCTYPE html><html><head><meta charset='UTF-8'>";
    html += "<meta http-equiv='refresh' content='2'>";  // recarrega sozinha a cada 2s
    html += "<title>ESP32 - OpenPLC</title></head><body>";
    html += "<h1>Painel ESP32</h1>";

    html += "<p>Entrada fisica: <b style=\"color:";
    html += g_entrada ? "green" : "red";
    html += "\">";
    html += g_entrada ? "LIGADA" : "DESLIGADA";
    html += "</b></p>";

    html += "<p>LED: <b>";
    html += g_led_comando ? "LIGADO" : "DESLIGADO";
    html += "</b></p>";

    html += "<p>";
    html += "<a href=\"/led/on\"><button>Ligar LED</button></a> ";
    html += "<a href=\"/led/off\"><button>Desligar LED</button></a>";
    html += "</p>";

    html += "</body></html>";
    return html;
}

void handleRoot()     { server.send(200, "text/html", pagina_html()); }
void handleNotFound() { server.send(404, "text/plain", "Pagina nao encontrada"); }

void handleLedOn()
{
    g_led_comando = true;
    server.sendHeader("Location", "/");
    server.send(303);   // redireciona de volta pra pagina principal
}

void handleLedOff()
{
    g_led_comando = false;
    server.sendHeader("Location", "/");
    server.send(303);
}

void setup()
{
    Serial.begin(115200);

    // O AP sobe uma unica vez aqui, sem depender de nenhum pino -
    // se dependesse de "entrada", nao teria como alcancar a pagina
    // pra ver/mudar esse estado antes do AP existir (paradoxo do ovo
    // e da galinha). softAP() e' sincrono, sem loop de espera.
    WiFi.mode(WIFI_AP);
    bool ok = WiFi.softAP(ap_ssid, ap_password);
    printf("server_ap: AP %s (IP=%s)\n", ok ? "iniciado" : "falhou",
           WiFi.softAPIP().toString().c_str());

    server.on("/", handleRoot);
    server.on("/led/on", handleLedOn);
    server.on("/led/off", handleLedOff);
    server.onNotFound(handleNotFound);
    server.begin();
}

void loop()
{
    server.handleClient();

    // sincroniza pinos <-> globais "espelho", uma vez por varredura
    g_entrada = entrada;        // le o pino de entrada (fisico -> pagina)
    led_saida = g_led_comando;  // escreve no pino de saida (pagina -> fisico)
}

END_FUNCTION_BLOCK