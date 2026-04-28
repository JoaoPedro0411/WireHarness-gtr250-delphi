# Decisões arquiteturais

## ADR-001: PDF como fonte visual principal

Decisão: renderizar o PDF original e sobrepor uma camada interativa.

Motivo: o diagrama original contém muitos detalhes. Redesenhar tudo aumenta o risco de erro.

Consequência: overlay precisa estar precisamente preso ao PDF.

## ADR-002: SVG por página como overlay

Decisão: usar SVG independente por página.

Motivo:

- facilita polyline/path;
- facilita evento de clique;
- facilita hit area invisível;
- facilita debug;
- facilita edição de pontos;
- facilita visualização de IDs;
- facilita exportação/validação.

## ADR-003: Coordenadas normalizadas

Decisão: persistir pontos como `x` e `y` entre 0 e 1 por página.

Motivo: evitar dependência de zoom, viewport, resolução, CSS ou devicePixelRatio.

## ADR-004: Transform único

Decisão: aplicar zoom/pan no container comum de PDF + overlay.

Motivo: aplicar transform separado aumenta risco de desalinhamento.

## ADR-005: Editor obrigatório

Decisão: incluir editor de mapeamento manual/assistido.

Motivo: o diagrama tem fios densos, paralelos e cruzados. Extração automática não é confiável o suficiente.

## ADR-006: Dados incertos explícitos

Decisão: usar `pending_review` e `confidence`.

Motivo: dado incompleto honesto é melhor que dado completo incorreto.

## ADR-007: Cores derivadas de função única

Decisão: centralizar tabela e parsing em `parseWireColor`.

Motivo: evitar inconsistência visual.

## ADR-008: Testar funções puras

Decisão: geometria, seleção e cores devem ser funções puras testáveis.

Motivo: bugs de coordenada são difíceis de detectar apenas visualmente.
