#!/usr/bin/env python3
"""Converte uma aula (Markdown) em PDF usando WeasyPrint.

Uso:
    build-pdf.py 02-linguagem-ladder/linguagem-ladder.md [saida.pdf]

Sem o 2º argumento, gera o PDF ao lado do .md, com o mesmo nome.
As imagens são resolvidas em relação à pasta do arquivo .md.
"""
import sys
import pathlib
import markdown
from weasyprint import HTML

CSS = """
@page {
    size: A4;
    margin: 2cm 2.2cm;
    @bottom-center {
        content: counter(page) " / " counter(pages);
        font-size: 9pt;
        color: #888;
    }
}
body {
    font-family: "DejaVu Serif", "Liberation Serif", Georgia, serif;
    font-size: 10.5pt;
    line-height: 1.5;
    color: #1a1a1a;
    hyphens: auto;
}
h1, h2, h3, h4 {
    font-family: "DejaVu Sans", "Liberation Sans", Arial, sans-serif;
    line-height: 1.25;
    color: #111;
    page-break-after: avoid;
}
h1 { font-size: 20pt; border-bottom: 2px solid #333; padding-bottom: .2em; }
h2 { font-size: 15pt; margin-top: 1.6em; border-bottom: 1px solid #ccc; padding-bottom: .15em; }
h3 { font-size: 12.5pt; margin-top: 1.3em; }
h4 { font-size: 11pt; }
p { margin: .5em 0; text-align: justify; }
img {
    max-width: 100%;
    display: block;
    margin: .8em auto;
    page-break-inside: avoid;
}
table {
    border-collapse: collapse;
    margin: 1em auto;
    width: 100%;
    font-size: 9.8pt;
    page-break-inside: avoid;
}
th, td {
    border: 1px solid #bbb;
    padding: .4em .6em;
    text-align: left;
    vertical-align: top;
}
th { background: #f0f0f0; font-family: "DejaVu Sans", sans-serif; }
code {
    font-family: "DejaVu Sans Mono", "Liberation Mono", monospace;
    font-size: 9pt;
    background: #f4f4f4;
    padding: .1em .3em;
    border-radius: 3px;
}
pre {
    background: #f6f8fa;
    border: 1px solid #e1e4e8;
    border-radius: 4px;
    padding: .8em 1em;
    overflow-x: auto;
    page-break-inside: avoid;
    line-height: 1.35;
}
pre code { background: none; padding: 0; font-size: 8.6pt; }
hr { border: none; border-top: 1px solid #ccc; margin: 1.8em 0; }
blockquote {
    border-left: 3px solid #ccc;
    margin: 1em 0;
    padding-left: 1em;
    color: #555;
}
a { color: #0b5fa5; text-decoration: none; }
ul, ol { margin: .5em 0; padding-left: 1.6em; }
li { margin: .25em 0; }
"""


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    md_path = pathlib.Path(sys.argv[1]).resolve()
    if not md_path.is_file():
        sys.exit(f"arquivo nao encontrado: {md_path}")
    out_path = (
        pathlib.Path(sys.argv[2]).resolve()
        if len(sys.argv) > 2
        else md_path.with_suffix(".pdf")
    )

    text = md_path.read_text(encoding="utf-8")
    html_body = markdown.markdown(
        text,
        extensions=["tables", "fenced_code", "codehilite", "sane_lists", "smarty"],
        extension_configs={"codehilite": {"guess_lang": False, "noclasses": True}},
    )
    html_doc = f"""<!DOCTYPE html>
<html lang="pt-BR"><head><meta charset="utf-8">
<title>{md_path.stem}</title><style>{CSS}</style></head>
<body>{html_body}</body></html>"""

    HTML(string=html_doc, base_url=str(md_path.parent)).write_pdf(str(out_path))
    print(f"gerado: {out_path}")


if __name__ == "__main__":
    main()
