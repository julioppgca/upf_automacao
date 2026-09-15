# Quadro-resumo — Tutorial OpenPLC Editor

> Versão condensada para apresentar no quadro. Aula completa: [tutorial-openplc-esp32.md](tutorial-openplc-esp32.md)

## Roteiro em 7 passos

1. **Criar projeto**: New Project → PLC Project → nome/pasta → Ladder Diagram
2. **Montar o programa**: Create new rung → editar contatos/bobina → nomear variáveis
3. **Variáveis**: criadas ao nomear (Class `Local`, Type `BOOL`)
4. **Escolher a placa**: `Display → Switch Perspective (F12)` → `Device →
   Configuration` → `ESP32-DOIT DEVKIT V1`
5. **Porta serial no Linux**:
   ```bash
   sudo chmod a+w /dev/ttyUSB0
   # permanente: sudo usermod -aG dialout $USER  (logout/login)
   ```
6. **Linkar variável ↔ pino**: Pin Mapping (na placa) + coluna `Location`
   (na variável)
7. **Transferir e depurar**: ícone de build → `Build and upload` → `Connect`
   → ícone **Debugger**

## Onde cada coisa fica

| Preciso de... | Vou em... |
|---|---|
| Editar contato NA/NF/borda | duplo clique → *Edit Contact Values* |
| Editar bobina normal/Set/Reset | duplo clique → *Edit Coil Values* |
| Trocar placa/porta serial | `Device → Configuration` |
| Ver o código gerado em ST | ícone `</>` no canto da tela do programa |
| Rodar em modo debug | ícone raio (Debugger) na barra lateral |
