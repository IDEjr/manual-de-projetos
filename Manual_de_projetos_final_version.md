---
title: "Manual de Projetos"
subtitle: "IDE 2026 — Padronização do ciclo de vida de Desenvolvimento de Software"
lang: pt-BR
toc-title: "Sumário"
---

<!--
  ============================================================================
  ARQUIVO-ROTEADOR. Este arquivo contém apenas capa, motivação, índice, os
  títulos de capítulo e as diretivas de inclusão. O texto de cada seção vive
  em capitulos/ e existe em UM único lugar — edite lá, nunca aqui.

  COMPILAÇÃO
  ----------
      sudo apt install pandoc            # e texlive-xetex, se for gerar PDF
      uv tool install pandoc-include     # NAO 'uvx': o pandoc precisa do
                                         # executavel no PATH, e o 'uv tool
                                         # install' o coloca em ~/.local/bin
      npm install -g mermaid-filter

      pandoc Manual_de_projetos_final_version.md \
             --filter pandoc-include \
             --filter mermaid-filter \
             --toc --toc-depth=3 \
             --number-sections=false \
             -o manual.docx

  A ORDEM DOS FILTROS IMPORTA: pandoc-include primeiro (traz os arquivos),
  mermaid-filter depois (renderiza os diagramas que chegaram).

  HTML — ESTE É O PRODUTO DE LEITURA. Arquivo único, autocontido (imagens e
  fontes em base64), com indice lateral fixo e o tema da identidade da IDE:

      pandoc Manual_de_projetos_final_version.md \
             --filter pandoc-include --filter mermaid-filter \
             --toc --toc-depth=3 --standalone --embed-resources \
             --template=manual-template.html --css=manual.css \
             --metadata title="Manual de Projetos" \
             --metadata subtitle="Padronizacao do ciclo de vida de Desenvolvimento de Software" \
             -o manual.html

  O tema vive em manual.css (cores e tipografia do MIV IDE, p.17/22/23) e o
  layout em manual-template.html. Para imprimir, use o proprio navegador: o
  CSS tem regras @media print que escondem o indice lateral e evitam quebrar
  tabela, diagrama e callout ao meio.

  ATENCAO ao adicionar capitulos: o pandoc-include analisa cada arquivo
  separadamente, entao o Pandoc NAO deduplica ancoras entre arquivos. Dois
  titulos com o mesmo texto em arquivos diferentes geram o mesmo id e o
  indice passa a apontar para o lugar errado. Foi o caso de 1.1 e 2.1, ambos
  "Introducao: Visao geral" — resolvido com id explicito {#sec-1-1-introducao}
  e {#sec-2-1-introducao}.

  Para PDF troque `-o manual.docx` por `-o manual.pdf` (exige LaTeX instalado,
  ex.: texlive-xetex, e `--pdf-engine=xelatex` para os acentos e o caractere ·).

  Requisitos: Mermaid >= 10.3 (o mermaid-filter empacota a sua própria versão).

  Caminhos de imagem: o pandoc-include os reescreve em relação à pasta do
  arquivo INCLUÍDO, não a este diretório. Por isso 1.3 aponta para
  `img/1.3-modelo-kano.png` — e por isso cada capítulo também abre sozinho,
  com a imagem no lugar, em qualquer visualizador de Markdown.

  Chromium: o .puppeteer.json ao lado deste arquivo passa --no-sandbox ao
  Chromium do mermaid-filter. Sem ele o Ubuntu 26.04 recusa o processo
  ("No usable sandbox") e a compilação falha inteira.
  ============================================================================
-->

# Motivação

O estabelecimento de um Ciclo de Vida de Desenvolvimento de Software (abreviadamente, SDLC) não deve ser encarado apenas como uma formalidade administrativa, mas como peça fundamental de uma organização que busca escalabilidade e qualidade técnica superior.

Para a IDE, que lida com um quadro de colaboradores majoritariamente composto por estudantes em semestres iniciais, o SDLC atua como um mecanismo de transferência de conhecimento e proteção contra a perda de capital intelectual decorrente da alta rotatividade.

A ausência de processos padronizados em tais contextos costuma resultar no fenômeno conhecido como "desenvolvimento ad-hoc", onde cada projeto segue uma lógica particular, impossibilitando a manutenção a longo prazo e gerando gargalos operacionais que impedem o giro de múltiplos projetos simultâneos.

A padronização dos momentos vitais da vida de um projeto (pré-contratual, durante contrato e pós-contratual) resulta frutos incalculáveis para tanto os colaboradores/voluntários (no que concerne ao aprendizado durante o ciclo de vida do projeto e à ausência de gargalos operacionais que desgastam a relação intra equipe) e à IDE quanto para os contratantes (que recebem um projeto realizado de maneira mais ágil, segura e perfeccionista).

Esses pontos, querer melhorar a experiência do membro da IDE na empresa, querer solidificar processos internos e querer proporcionar ao cliente um produto sólido e de valor, somados a um histórico de experiências com projetos passados, nos motivam a não medir esforços na confecção do informalmente intitulado “Manual de Projetos” e justificam tais investimentos nesse sentido.

# Índice

1. **Modus Operandi da lógica pré-contratual:** Engenharia de Requisitos e Fundamentação Estratégica do Projeto, como proceder em cada etapa
   1. Introdução: Visão geral
   2. Reuniões com o cliente, como proceder?
   3. Levantamento de Requisitos
   4. Análise de Projeto
      1. Análise de tecnologias
      2. Esboço de projeto: “Diagrama de caixinhas”
   5. Orçamento e Montagem de Apresentação
2. **Lógica durante contrato:** Normas e padrões organizacionais na confecção de projetos
   1. Introdução: Visão geral
   2. GitHub: Guia sobre uso em projetos
      1. Criação e configuração inicial do repositório
      2. Issues: transformando o projeto em tarefas
      3. Branches e modelo de ramificação
      4. Commits
      5. Pull Requests
      6. Revisão de código
      7. Merge e encerramento da tarefa
      8. Divisão de responsabilidades
   3. Design de sistemas: Práticas essenciais e regras gerais no design de sistemas e sites
      1. Design não é apenas estética
      2. Caso prático IDE: o aplicativo dos motoboys
      3. Antes de desenhar: entender o problema
      4. Pesquisa fundamentada
      5. Esboço do design
      6. Consistência
      7. Design System e biblioteca de componentes
      8. Hierarquia visual e prioridade
      9. Estados e feedback ao usuário
      10. Responsividade e diferentes dispositivos
      11. Acessibilidade (A11y): padrão mínimo, não diferencial
      12. Heurísticas de Nielsen: instrumento de revisão
      13. Aprovação interna antes da apresentação ao cliente
      14. Aprovação do cliente
      15. Implementação e ciclo de revisão
      16. Regra geral
   4. Diagramação Técnica e Arquitetural: Orquestrando o desenvolvimento do projeto
      1. Matriz de Requisitos Funcionais
      2. User Stories
      3. User Flow
      4. Diagrama de Classes
      5. Diagrama de Sequência
      6. Modelo Físico de Dados e Máquinas de Estado
      7. Visão Arquitetural: o Modelo C4
      8. Documentação como Código (*Docs-as-Code*)
      9. Anti-padrões de diagramação
   5. Padrões e convenções de desenvolvimento
      1. Nomenclatura e formatação
      2. Documentação e comentários
      3. Convenções por stack
      4. Modularidade e princípios SOLID
      5. Code Smells
      6. Tratamento de erros e segredos
      7. Testes automatizados
      8. Git: commits e branches
      9. Code Review
3. **Da finalização do projeto**
   1. Terminamos o projeto, o que fazer agora?
4. **Referências**
5. **Agradecimentos**

# 1. Modus Operandi da lógica pré-contratual: Engenharia de Requisitos e Fundamentação Estratégica do Projeto, como proceder em cada etapa

!include capitulos/1.1-introducao-visao-geral.md

!include capitulos/1.2-reunioes-com-o-cliente.md

!include capitulos/1.3-levantamento-de-requisitos.md

## 1.4 Análise de Projeto

A análise de projeto tem duas metades que se alimentam mutuamente: decidir **com que tecnologia**
o projeto será construído e desenhar **o que** será construído. Elas podem — e frequentemente
devem — ocorrer na mesma sessão de trabalho da dupla Comercial × Projetos, logo após a segunda
reunião com o cliente.

!include capitulos/1.4.1-analise-de-tecnologias.md

!include capitulos/1.4.2-esboco-de-projeto.md

!include capitulos/1.5-orcamento-e-apresentacao.md

# 2. Lógica durante contrato: Normas e padrões organizacionais na confecção de projetos

!include capitulos/2.1-introducao-visao-geral.md

!include capitulos/2.2-github.md

!include capitulos/2.3-design-de-sistemas.md

!include capitulos/2.4-diagramacao-tecnica.md

!include capitulos/2.5-padroes-e-convencoes.md

# 3. Da finalização do projeto

!include capitulos/3.1-encerramento-do-projeto.md

# 4. Referências

Kalbach, Jim. *Mapping Experiences: A Complete Guide to Creating Value Through Journey Maps, Diagrams, and Maps*. O'Reilly Media, 2020.

Mountain Goat Software. *User Stories and User Story Examples*. Disponível em: [https://www.mountaingoatsoftware.com/agile/user-stories](https://www.mountaingoatsoftware.com/agile/user-stories).

Larman, Craig. *Utilizando UML e Padrões*.

Fowler, Martin. *UML Essencial*.

> As referências específicas do capítulo 2.4 estão listadas ao final daquele capítulo, em
> *Referências do capítulo*.

# 5. Agradecimentos

Este manual nasceu de uma inquietação simples: a de que o conhecimento acumulado em cada projeto da
IDE não deveria sair pela porta junto com o membro que o adquiriu. Ele é, antes de tudo, uma
tentativa de tornar coletivo aquilo que até então era individual.

Nada disso teria sido possível sozinho. O que está escrito aqui é a soma de experiências vividas em
projetos reais, de erros que custaram caro, de discussões em reunião e de correções feitas por quem
conhecia o assunto melhor do que o autor.

**Idealização e autoria**

[Pedro Muller Legnaghi](https://www.linkedin.com/in/pedro-muller-legnaghi/)

**Coautoria e colaboração**

- [Matheus Sabadim](https://www.linkedin.com/in/m-sab/)
- [Profa. Karina Kohl](https://www.linkedin.com/in/karinakohl/)
- [Leonardo Santos](https://www.linkedin.com/in/leorsantos2003/)
- [Bruno Delgiovo](https://www.linkedin.com/in/bruno-delgiovo-b92443347/)
- [Alberto Uhmann](https://www.linkedin.com/in/alberto-uhmann/)
- [Giovani Susin](https://www.linkedin.com/in/giovani-lorenzo-moraga-susin-99a5603b7/)
- [Kauan Rakoski](https://www.linkedin.com/in/kauan-rakoski/)
- Bruno Mengue
- [Miguel](https://www.linkedin.com/in/mdfguerra/)

A cada um deles, o agradecimento pelo tempo, pela leitura atenta e pela disposição de transformar
prática em processo escrito.

O agradecimento se estende a todos os membros da IDE que, mesmo sem escrever uma linha deste
documento, o construíram na prática — executando projetos, cometendo e corrigindo erros, e
sustentando a empresa júnior que dá sentido a tudo isto.

> Este é um documento vivo. Quem vier depois tem não apenas a permissão, mas a incumbência de
> corrigi-lo, ampliá-lo e mantê-lo verdadeiro.
