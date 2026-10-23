# Reprodução — versão 3

Em Windows, com Python 3.12 ou superior:

```powershell
python -m pip install numpy matplotlib markdown reportlab pillow
python gerar-aula.py
```

O script usa Georgia, Arial e Consolas de C:/Windows/Fonts.
Gera doze figuras, equações, tabelas, quatro CSVs, HTML e PDF.
Os blocos BEGIN/END do Markdown são tabelas recalculadas pelo script
(inclusive as tabelas passo a passo MALHA_ABERTA, P_PASSO, PI_PASSO e PID_PASSO).
A figura malha.png é estática; as demais são geradas.
Os demais textos são preservados. O PDF tem 28 páginas. Feche o PDF no leitor antes de rodar o script (no Windows o arquivo aberto fica bloqueado).

As tabelas contínuas usam soluções analíticas. As discretas usam saída
mantida e solução exata da planta entre amostras. I[0] = 0;
a integral é atualizada com o erro atual a partir da amostra k = 1.

O PDF usa ReportLab para reproduzir características do modelo local.
Os gráficos são simulações didáticas. As fontes externas estão na aula.
