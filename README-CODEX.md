# Hyosung Electrical Diagram Overlay

Aplicação Node.js/TypeScript para transformar diagramas elétricos Hyosung em PDF em uma ferramenta interativa de análise técnica.

## Foco do projeto

Precisão técnica.

A aplicação deve permitir visualizar o PDF original e selecionar fios individuais com um overlay perfeitamente alinhado.

## PDFs esperados

Coloque os PDFs em:

```text
public/pdfs/Esquema_Eletrico_Hyosung.pdf
public/pdfs/Manual Hyosung delphi.pdf
```

O script `setup-hyosung-codex-context.sh` tenta copiar esses arquivos automaticamente se eles estiverem na raiz do repositório.

## Documentos importantes

Antes de desenvolver, leia:

- `AGENTS.md`
- `CODEX_MASTER_PROMPT.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/PDF_SOURCE_OF_TRUTH.md`
- `docs/DATA_MODEL.md`
- `docs/ARCHITECTURE_DECISIONS.md`
- `docs/EXTRACTION_NOTES.md`
- `docs/VALIDATION_CHECKLIST.md`
- `docs/MAPPING_STATUS.md`

## Agentes especializados

Documentos em:

```text
.codex/agents/
```

Eles descrevem responsabilidades para PDF, overlay, coordenadas, mapeamento, cores, dados, frontend e QA.

## Comandos de diagnóstico

```bash
bash scripts/codex-diagnose.sh
```

## Scaffold opcional

Se o projeto ainda estiver vazio:

```bash
bash setup-hyosung-codex-context.sh --with-scaffold
npm install
npm run dev
```

## Validação

Use:

```text
docs/VALIDATION_CHECKLIST.md
```

O projeto não deve ser considerado pronto enquanto o overlay não permanecer alinhado após:

- zoom;
- pan;
- resize;
- seleção de fio;
- foco no fio;
- foco no conector;
- alternância de diagrama;
- visualização de páginas pareadas.
