#!/usr/bin/env bash
set -euo pipefail

echo "== Contexto do repositório =="
pwd
echo

echo "== Arquivos da raiz =="
ls -la
echo

echo "== Git =="
git status --short 2>/dev/null || true
git branch --show-current 2>/dev/null || true
echo

echo "== Arquivos até profundidade 3 =="
find . -maxdepth 3 -type f | sed 's#^\./##' | sort | head -300
echo

echo "== Arquivos de configuração e PDFs =="
find . -maxdepth 5 \( \
  -name "package.json" \
  -o -name "vite.config.*" \
  -o -name "next.config.*" \
  -o -name "tsconfig.json" \
  -o -name "tsconfig.*.json" \
  -o -name "eslint.config.*" \
  -o -name ".eslintrc*" \
  -o -name "AGENTS.md" \
  -o -iname "*.pdf" \
\) -print | sort
echo

echo "== Versões =="
node -v 2>/dev/null || true
npm -v 2>/dev/null || true
pnpm -v 2>/dev/null || true
yarn -v 2>/dev/null || true
echo

echo "== package.json =="
cat package.json 2>/dev/null || true
echo

echo "== npm scripts =="
npm run 2>/dev/null || true
echo

echo "== PDFs e imagens =="
find . -maxdepth 6 -type f \( -iname "*.pdf" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) -print | sort
echo

echo "== Busca por termos relevantes =="
grep -R "pdfjs\|pdf.js\|PDF\|canvas\|svg\|overlay\|wire\|zoom\|pan\|scale\|devicePixelRatio\|connector\|fios\|wires\|polyline\|path" -n . 2>/dev/null | head -400 || true
echo

if command -v pdfinfo >/dev/null 2>&1; then
  echo "== pdfinfo Esquema_Eletrico_Hyosung.pdf =="
  pdfinfo "public/pdfs/Esquema_Eletrico_Hyosung.pdf" 2>/dev/null || true
  echo

  echo "== pdfinfo Manual Hyosung delphi.pdf =="
  pdfinfo "public/pdfs/Manual Hyosung delphi.pdf" 2>/dev/null || true
  echo

  echo "== pdfinfo -box Esquema_Eletrico_Hyosung.pdf =="
  pdfinfo -box "public/pdfs/Esquema_Eletrico_Hyosung.pdf" 2>/dev/null || true
  echo

  echo "== pdfinfo -box Manual Hyosung delphi.pdf =="
  pdfinfo -box "public/pdfs/Manual Hyosung delphi.pdf" 2>/dev/null || true
  echo
else
  echo "pdfinfo não instalado."
  echo
fi

echo "== Verificação de PDFs esperados =="
for pdf in \
  "public/pdfs/Esquema_Eletrico_Hyosung.pdf" \
  "public/pdfs/Manual Hyosung delphi.pdf"
do
  if [[ -f "$pdf" ]]; then
    echo "OK: $pdf"
  else
    echo "AUSENTE: $pdf"
  fi
done
echo

echo "== Diagnóstico concluído =="
