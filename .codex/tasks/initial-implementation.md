# Tarefa Codex: implementação inicial

## Objetivo

Criar a primeira versão funcional da aplicação.

## Entrada

Leia:

- `AGENTS.md`
- `CODEX_MASTER_PROMPT.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/PDF_SOURCE_OF_TRUTH.md`
- `docs/DATA_MODEL.md`

## Passos

1. Rodar `bash scripts/codex-diagnose.sh`.
2. Detectar stack existente.
3. Se projeto vazio, criar Vite + React + TypeScript.
4. Instalar/configurar `pdfjs-dist`.
5. Criar viewer de PDF.
6. Criar seletor de diagrama.
7. Criar stitched view horizontal.
8. Criar overlay SVG por página.
9. Criar estrutura de dados inicial.
10. Criar tabela de cores.
11. Criar funções de geometria.
12. Criar testes de cor/geometria.
13. Criar debug básico.
14. Rodar build/test.

## Entregável mínimo

- Aplicação abre.
- PDFs são listados.
- Diagrama selecionado renderiza.
- Páginas pareadas aparecem lado a lado.
- Overlay SVG existe e acompanha página.
- Debug mostra métricas básicas.
- Testes iniciais passam.

## Não fazer

- Não declarar fios mapeados.
- Não preencher paths inventados.
- Não afirmar validação visual completa.
