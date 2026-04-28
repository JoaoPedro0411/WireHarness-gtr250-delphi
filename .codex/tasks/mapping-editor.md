# Tarefa Codex: editor de mapeamento

## Objetivo

Criar modo de edição para mapear fios diretamente sobre o PDF.

## Entrada

Leia:

- `.codex/agents/wire-mapping-agent.md`
- `.codex/agents/overlay-coordinate-agent.md`
- `docs/DATA_MODEL.md`
- `docs/MAPPING_STATUS.md`

## Funcionalidades

- Ativar/desativar editor.
- Criar fio.
- Selecionar página.
- Adicionar pontos clicando no PDF.
- Arrastar pontos existentes.
- Remover ponto.
- Editar código de cor.
- Editar origem/destino.
- Editar conector/pino.
- Definir `confidence`.
- Definir `validationStatus`.
- Exportar JSON.
- Importar JSON.
- Mostrar coordenadas normalizadas.

## Critério de aceitação

O usuário consegue traçar um fio sobre o PDF, salvar em JSON, recarregar e ver o fio no mesmo lugar.
