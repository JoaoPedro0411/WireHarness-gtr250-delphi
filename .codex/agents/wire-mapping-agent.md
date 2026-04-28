# Agente: Mapeamento de fios

## Responsabilidade

Criar infraestrutura para mapear fios individualmente com precisão sobre o PDF.

## Tarefas

- Criar tipo `Wire`.
- Criar tipo `WirePath`.
- Criar tipo `PageContinuation`.
- Criar editor de mapeamento.
- Criar seleção por distância até polyline.
- Criar exportação/importação de JSON.
- Criar lista de pendências.
- Criar desambiguação de fios próximos.

## Editor obrigatório

O editor deve permitir:

- criar fio;
- selecionar fio;
- adicionar ponto;
- arrastar ponto;
- remover ponto;
- definir `colorCode`;
- definir origem/destino;
- definir conector/pino;
- definir `confidence`;
- definir `validationStatus`;
- exportar JSON;
- importar JSON.

## Hit testing

Implementar:

```ts
getDistanceFromPointToSegment()
getDistanceFromPointToPolyline()
findNearestWire()
findCandidateWires()
```

## Regras

- Seleção é por fio individual.
- Não selecionar grupo.
- Não aumentar destaque visual para facilitar clique.
- Hit area invisível deve ser maior que destaque.
- Fios próximos devem abrir candidatos ou ter desambiguação.
- Fio sem confirmação fica `pending_review`.
- Fio não deve virar `validated` sem validação visual.
