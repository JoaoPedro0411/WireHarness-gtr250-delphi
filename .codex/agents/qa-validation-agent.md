# Agente: QA e Validação

## Responsabilidade

Garantir que a aplicação seja testável, validável e confiável.

## Testes obrigatórios

- `parseWireColor`
- `getWireRenderStyle`
- `normalizedToPagePoint`
- `pageToNormalizedPoint`
- `screenToPagePoint`
- `pageToScreenPoint`
- `getDistanceFromPointToSegment`
- `getDistanceFromPointToPolyline`
- `findNearestWire`
- `findCandidateWires`
- `getWireBoundingBox`
- `getConnectorBoundingBox`

## Cenários obrigatórios

- cor simples;
- cor com listra;
- código desconhecido;
- clique exatamente sobre fio;
- clique perto do fio;
- clique fora da tolerância;
- fios paralelos;
- fios em páginas diferentes;
- conversão ida/volta de coordenadas;
- bounding box de polyline.

## Comandos finais

Rodar, quando existirem:

```bash
npm run test
npm run build
npm run lint
npm run typecheck
```

## Regras

- Não finalizar com testes falhando sem explicar.
- Não ocultar limitações.
- Não declarar validação manual feita se não foi feita.
- Atualizar `docs/MAPPING_STATUS.md` quando houver progresso.
