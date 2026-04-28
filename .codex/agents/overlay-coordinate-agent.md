# Agente: Overlay e Coordenadas

## Responsabilidade

Garantir que o overlay fique perfeitamente alinhado ao PDF em qualquer zoom, pan, resize e devicePixelRatio.

## Tarefas

- Criar overlay SVG por página.
- Usar `PageContainer` com `position: relative`.
- Renderizar PDF e SVG dentro do mesmo container.
- Manter mesma origem visual.
- Usar coordenadas normalizadas.
- Criar conversões testáveis.
- Criar debug de métricas.
- Validar zoom/pan/resize.

## Funções obrigatórias

```ts
normalizedToPagePoint()
pageToNormalizedPoint()
screenToPagePoint()
pageToScreenPoint()
getPageViewportMetrics()
getOverlayTransform()
```

## Regras de ouro

- Não persistir coordenadas em pixels de tela.
- Não posicionar overlay "no olho".
- Não duplicar cálculo geométrico em componentes.
- Não usar overlay global para várias páginas sem matriz de transformação comprovada.
- Preferir overlay por página.
- Zoom/pan deve transformar PDF e overlay juntos.

## Debug obrigatório

Mostrar:

- pageRect;
- overlayRect;
- canvas size;
- CSS size;
- scale;
- zoom;
- pan;
- devicePixelRatio;
- cursor normalizado;
- cursor em coordenada de página;
- diferença visual PDF/overlay, se calculável.
