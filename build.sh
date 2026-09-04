#!/usr/bin/env bash
# Compila o Manual de Projetos. Uso:
#   ./build.sh          -> manual.html  (produto de leitura)
#   ./build.sh docx     -> manual.docx  (para quem precisa comentar no Word/Docs)
#   ./build.sh pdf      -> manual.pdf   (exige LaTeX; ver README)
set -euo pipefail
cd "$(dirname "$0")"

# O -w do mmdc e um MAXIMO: diagramas mais largos que isso sao espremidos e o
# texto fica ilegivel (foi o caso do diagrama de sequencia). 1400 da folga; o
# CSS deixa rolar horizontalmente o que ainda passar da coluna.
export MERMAID_FILTER_WIDTH=1400

FONTE="Manual_de_projetos_final_version.md"
ALVO="${1:-html}"

# A ordem dos filtros importa: pandoc-include traz os capítulos,
# mermaid-filter renderiza os diagramas que chegaram com eles.
COMUM=(--filter pandoc-include --filter mermaid-filter --toc --toc-depth=3)

for prog in pandoc pandoc-include mermaid-filter; do
  command -v "$prog" >/dev/null || { echo "ERRO: '$prog' não encontrado. Veja o README."; exit 1; }
done

case "$ALVO" in
  html)
    pandoc "$FONTE" "${COMUM[@]}" \
      --standalone --embed-resources \
      --template=manual-template.html --css=manual.css \
      --metadata title="Manual de Projetos" \
      --metadata subtitle="Padronização do ciclo de vida de Desenvolvimento de Software" \
      -o manual.html
    echo "OK -> manual.html"
    ;;
  docx)
    pandoc "$FONTE" "${COMUM[@]}" -o manual.docx
    echo "OK -> manual.docx"
    ;;
  pdf)
    pandoc "$FONTE" "${COMUM[@]}" --pdf-engine=xelatex -o manual.pdf
    echo "OK -> manual.pdf"
    ;;
  *)
    echo "Alvo desconhecido: $ALVO (use html, docx ou pdf)"; exit 1
    ;;
esac

rm -f mermaid-filter.err
