#!/usr/bin/env bash
set -euo pipefail

REQUIRED_FILES=(
  "AGENTS.md"
  "CODEX_MASTER_PROMPT.md"
  "README-CODEX.md"
  "docs/PROJECT_CONTEXT.md"
  "docs/PDF_SOURCE_OF_TRUTH.md"
  "docs/DATA_MODEL.md"
  "docs/ARCHITECTURE_DECISIONS.md"
  "docs/EXTRACTION_NOTES.md"
  "docs/VALIDATION_CHECKLIST.md"
  "docs/MAPPING_STATUS.md"
  ".codex/agents/master-coordinator-agent.md"
  ".codex/agents/pdf-rendering-agent.md"
  ".codex/agents/overlay-coordinate-agent.md"
  ".codex/agents/wire-mapping-agent.md"
  ".codex/agents/wire-color-agent.md"
  ".codex/agents/frontend-ux-agent.md"
  ".codex/agents/data-integrity-agent.md"
  ".codex/agents/qa-validation-agent.md"
  ".codex/tasks/initial-implementation.md"
  ".codex/tasks/mapping-editor.md"
  ".codex/tasks/validation-pass.md"
  ".codex/review/code_review.md"
  "scripts/codex-diagnose.sh"
)

missing=0

for file in "${REQUIRED_FILES[@]}"; do
  if [[ -f "$file" ]]; then
    echo "OK: $file"
  else
    echo "FALTANDO: $file"
    missing=1
  fi
done

echo

if [[ -f "public/pdfs/Esquema_Eletrico_Hyosung.pdf" ]]; then
  echo "OK: public/pdfs/Esquema_Eletrico_Hyosung.pdf"
else
  echo "AVISO: public/pdfs/Esquema_Eletrico_Hyosung.pdf ausente"
fi

if [[ -f "public/pdfs/Manual Hyosung delphi.pdf" ]]; then
  echo "OK: public/pdfs/Manual Hyosung delphi.pdf"
else
  echo "AVISO: public/pdfs/Manual Hyosung delphi.pdf ausente"
fi

echo

if [[ "$missing" -ne 0 ]]; then
  echo "Contexto incompleto."
  exit 1
fi

echo "Contexto obrigatório presente."
