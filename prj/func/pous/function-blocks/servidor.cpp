FUNCTION_BLOCK servidor
  VAR
  END_VAR
#include <Arduino.h>
#include <WiFi.h>
#include <WebServer.h>

// Dados da rede Wi-Fi
const char* ssid     = "open_plc";
const char* password = "1234";

// Servidor HTTP na porta 80
WebServer server(80);

// Página principal
void handleRoot()
{
    String html;

    html += "<!DOCTYPE html>";
    html += "<html>";
    html += "<head>";
    html += "<meta charset='UTF-8'>";
    html += "<title>ESP32</title>";
    html += "</head>";

    html += "<body>";
    html += "<h1>Servidor ESP32</h1>";
    html += "<p>ESP32 conectado ao Wi-Fi!</p>";
    html += "</body>";

    html += "</html>";

    server.send(200, "text/html", html);
}

// Página não encontrada
void handleNotFound()
{
    server.send(404, "text/plain", "Pagina nao encontrada");
}

void setup()
{
    // Serial.begin(115200);

    // Conecta ao Wi-Fi
    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid, password);

    // Serial.print("Conectando ao Wi-Fi");

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
        Serial.print(".");
    }

    // Serial.println();
    // Serial.println("Wi-Fi conectado!");

    // Serial.print("Endereco IP: ");
    // Serial.println(WiFi.localIP());

    // Rotas HTTP
    server.on("/", handleRoot);

    server.onNotFound(handleNotFound);

    // Inicia servidor
    server.begin();

    // Serial.println("Servidor HTTP iniciado.");
}

void loop()
{
    server.handleClient();
}

END_FUNCTION_BLOCK