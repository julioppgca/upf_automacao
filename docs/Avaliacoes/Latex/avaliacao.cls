\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{avaliacao}[2026/09/29 v1.0 Classe reutilizavel para avaliacoes/provas (baseada em exam)]

%% -----------------------------------------------------------------
%% Opcoes: por padrao repassa addpoints/10pt/a4paper/brazil pra classe
%% "exam", mas qualquer opcao nao reconhecida aqui tambem e' repassada
%% direto pra "exam" - dá pra fazer \documentclass[12pt]{avaliacao}
%% sem precisar editar esta classe.
%% -----------------------------------------------------------------
\PassOptionsToClass{addpoints, 10pt, a4paper, brazil}{exam}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\LoadClass{exam}

%% -----------------------------------------------------------------
%% Pacotes padrao
%% -----------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[brazil]{babel}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage[left=1.2cm, right=1.2cm, top=1.5cm, bottom=2cm]{geometry}
\RequirePackage{enumitem}
\RequirePackage{circuitikz}
\RequirePackage{tikz}
\usetikzlibrary{automata, positioning, arrows.meta}
\usetikzlibrary{karnaugh}
\RequirePackage{booktabs}
% fancyhdr NAO e' carregado de proposito: a classe "exam" ja define
% \lhead/\chead/\rhead/\lfoot/\cfoot/\rfoot por conta propria (pra
% compatibilidade com documentos antigos), e carregar o pacote
% fancyhdr de verdade por cima causa erro de "Command ... already
% defined". Os comandos de cabecalho/rodape usados aqui (\pagestyle
% {headandfoot}, \firstpageheader, \runningheader...) sao nativos do
% "exam" e nao precisam de fancyhdr.
\RequirePackage{comment}
\RequirePackage{amsmath}
\RequirePackage{color}

%% -----------------------------------------------------------------
%% Estilo padrao de gabarito/solucoes (comandos da classe "exam")
%% -----------------------------------------------------------------
\shadedsolutions
\definecolor{SolutionColor}{rgb}{0.8,0.9,1}
\renewcommand{\solutiontitle}{\noindent\textbf{Solução:}\par\noindent}
\newcommand{\ans}[1]{\textbf{\textcolor{blue}{#1}}}

\pointpoints{pt}{pts} % pontuacao em portugues ("1 pt" / "2 pts")

% Opcao de multipla escolha em branco, estilo "(  ) alternativa"
\newcommand{\blankchoice}[1]{\item[\hspace{1em}(\hspace{1em})] #1}
\renewcommand{\choicelabel}{\alph{choice}.}

%% -----------------------------------------------------------------
%% Metadados da avaliacao - preenchidos via \configuraavaliacao no
%% preambulo do main.tex de cada prova. Nao edite estes comandos
%% diretamente; use \configuraavaliacao.
%% -----------------------------------------------------------------
\newcommand{\av@instituto}{}
\newcommand{\av@codigo}{}
\newcommand{\av@disciplina}{}
\newcommand{\av@professor}{}
\newcommand{\av@titulo}{}
\newcommand{\av@data}{}
\newcommand{\av@logo}{}

% \configuraavaliacao{instituto}{codigo}{disciplina}{professor}{titulo}{data}{logo}
%
%   instituto  - ex.: "ITec - Instituto de Tecnologia"
%   codigo     - codigo da disciplina, ex.: "ECP187"
%   disciplina - nome da disciplina, ex.: "Fundamentos de Circuitos Digitais"
%   professor  - nome do professor
%   titulo     - titulo/numero desta avaliacao, ex.: "Avaliação \#1"
%   data       - data exibida no cabecalho, ex.: "abril de 2026"
%   logo       - caminho (relativo ao main.tex) da imagem do logo
%
% Chama automaticamente \av@montacabecalhos ao final, entao uma unica
% chamada ja deixa cabecalho/rodape de todas as paginas configurados.
\newcommand{\configuraavaliacao}[7]{%
  \renewcommand{\av@instituto}{#1}%
  \renewcommand{\av@codigo}{#2}%
  \renewcommand{\av@disciplina}{#3}%
  \renewcommand{\av@professor}{#4}%
  \renewcommand{\av@titulo}{#5}%
  \renewcommand{\av@data}{#6}%
  \renewcommand{\av@logo}{#7}%
  \av@montacabecalhos
}

%% -----------------------------------------------------------------
%% Cabecalhos/rodapes de pagina (estilo "headandfoot" da classe exam)
%% -----------------------------------------------------------------
\newcommand{\av@montacabecalhos}{%
  \pagestyle{headandfoot}
  \firstpageheader{}{\large\textbf{\av@titulo}}{\av@data}
  \firstpagefooter
    {Página \thepage\ de \numpages}
    {}
    {Pontos marcados \makebox[.5in]{\hrulefill}\\
     de \pointsonpage{\thepage} pontos possíveis.}
  \runningheader{\av@codigo}{}{\av@disciplina}
  \runningfooter
    {Página \thepage\ de \numpages}
    {}
    {Pontos marcados \makebox[.5in]{\hrulefill}\\
     de \pointsonpage{\thepage} pontos possíveis.}
}

%% -----------------------------------------------------------------
%% Bloco impresso no topo da 1a pagina: logo + identificacao + aluno.
%% Chame logo apos \begin{document}, antes de \begin{questions}.
%% -----------------------------------------------------------------
\newcommand{\imprimecabecalho}{%
  \begin{flushleft}
  \begin{center}
    \begin{tabular}{@{}l@{}}
      \includegraphics[width=5cm]{\av@logo}
    \end{tabular}
    \quad
    \begin{tabular}{@{}c@{}c@{}}
      \large\textbf{\av@instituto} \\
      \textbf{\av@codigo} -- \av@disciplina \\
      Prof.: \av@professor
    \end{tabular}
  \end{center}
  \vspace{1cm}
  Aluno: \underline{\hspace{10cm}} \quad Matrícula: \underline{\hspace{3cm}}
  \vspace{0.5cm}
  \end{flushleft}
  \par\noindent\rule{\linewidth}{0.4pt}
  \vspace{0.25cm}
}

%% -----------------------------------------------------------------
%% Tabela de pontuacao final (opcional) - chame dentro de
%% \begin{questions}...\end{questions}, no fim das questoes.
%% -----------------------------------------------------------------
\newcommand{\tabelapontuacao}{%
  \vspace{3cm}
  \centering\textbf{Pontuação:}
  \hpgword{Página}
  \hpword{Pontos}
  \hsword{Acertos}
  \begin{center}
  \gradetable[h][pages]
  \end{center}
}

\endinput
