# CODEX_MASTER_PROMPT.md

## Prompt principal para usar no Codex

Você é o Codex atuando como engenheiro sênior de software especializado em Node.js, TypeScript, React, PDF.js, SVG, geometria 2D, extração de dados técnicos de PDF e validação de aplicações visuais.

Preciso criar uma aplicação usando Node.js para transformar diagramas elétricos Hyosung em PDF em uma ferramenta técnica interativa.

Os PDFs de origem são:

- `public/pdfs/Esquema_Eletrico_Hyosung.pdf`
- `public/pdfs/Manual Hyosung delphi.pdf`

No momento, o projeto só precisa funcionar com esses PDFs. Não otimize prematuramente para PDFs externos.

## Objetivo principal

Criar uma aplicação que:

1. renderize o PDF original;
2. crie overlay SVG perfeitamente alinhado;
3. permita selecionar fios individualmente;
4. destaque fios com cor correta;
5. represente fios com listras;
6. permita zoom, pan e foco sem desalinhamento;
7. permita mapear fios manualmente sobre o PDF;
8. permita exportar/importar dados de mapeamento;
9. mantenha dados incertos como `pending_review`;
10. tenha modo debug para validação visual.

## Prioridade absoluta

A prioridade não é interface bonita.

A prioridade é uma ferramenta tecnicamente confiável.

Se houver conflito entre estética e precisão, escolha precisão.

## Modo de trabalho obrigatório

Antes de modificar código:

1. leia `AGENTS.md`;
2. leia toda a documentação em `docs/`;
3. leia os agentes em `.codex/agents/`;
4. execute `bash scripts/codex-diagnose.sh`;
5. identifique se o projeto já tem stack;
6. identifique se os PDFs estão presentes;
7. faça um plano curto;
8. só depois implemente.

Não comece criando componentes sem entender a estrutura.

## Diagnóstico obrigatório

Responda internamente e considere no plano:

- os PDFs existem em `public/pdfs/`?
- o projeto já tem `package.json`?
- há Vite, React, Next ou outro framework?
- há TypeScript?
- há testes?
- há renderização de PDF existente?
- há overlay existente?
- há zoom/pan existente?
- há dados de fios/conectores existentes?
- há scripts de build/test?
- existe risco de sobrescrever código útil?

## Stack esperada se o projeto estiver vazio

Use:

- Node.js;
- TypeScript;
- Vite;
- React;
- `pdfjs-dist`;
- SVG overlay;
- Vitest.

## Arquitetura visual esperada

```text
DiagramApp
  DiagramToolbar
  DiagramViewport
    TransformLayer
      StitchedDiagram
        PageContainer page 1
          PdfPageCanvas
          SvgWireOverlay
          DebugOverlay
        PageContainer page 2
          PdfPageCanvas
          SvgWireOverlay
          DebugOverlay
  WireDetailsPanel
  MappingEditorPanel
```

Regra crítica: o transform de zoom/pan deve ser aplicado ao container comum que contém PDF e overlay.

## Requisitos de renderização do PDF

- Usar `pdfjs-dist`.
- Renderizar páginas específicas.
- Suportar pares de páginas lado a lado.
- Controlar escala.
- Controlar rotação.
- Medir viewport.
- Medir canvas real e tamanho CSS.
- Expor métricas para debug.
- Não deixar text layer ou annotation layer desalinharem overlay.
- Começar com canvas + SVG overlay.

## Requisitos do overlay

- Um SVG overlay por página.
- Mesma largura visual do PDF.
- Mesma altura visual do PDF.
- Mesma origem X/Y.
- `position: absolute` dentro do `PageContainer`, ou alternativa igualmente precisa.
- `PageContainer` deve ser `position: relative`.
- Overlay deve receber `viewBox` compatível com coordenadas da página.
- Pontos persistidos dos fios devem ser normalizados.
- Converter normalizado -> página na renderização.
- Converter clique de tela -> página -> normalizado na seleção/edição.

## Sistema de coordenadas

Persistir pontos assim:

```ts
type NormalizedPoint = {
  x: number; // 0 a 1
  y: number; // 0 a 1
};
```

Funções obrigatórias:

```ts
normalizedToPagePoint(point, pageSize)
pageToNormalizedPoint(point, pageSize)
screenToPagePoint(point, pageRect, transform)
pageToScreenPoint(point, pageRect, transform)
getDistanceFromPointToSegment(point, a, b)
getDistanceFromPointToPolyline(point, polyline)
findNearestWire(clickPoint, wires, tolerance)
findCandidateWires(clickPoint, wires, tolerance)
getWireBoundingBox(wire)
getConnectorBoundingBox(connector)
```

Essas funções devem ficar fora de componentes React e ter testes.

## Requisitos de seleção de fios

Ao clicar/tocar:

1. identificar a página correta;
2. converter o ponto da tela para coordenada da página;
3. converter para normalizado;
4. considerar apenas fios da página;
5. calcular distância até cada polyline;
6. selecionar fio mais próximo dentro da tolerância;
7. se houver ambiguidade, mostrar candidatos;
8. se não houver fio dentro da tolerância, não selecionar nada.

Separar:

- hit area invisível;
- destaque visível.

Não engrossar o destaque para facilitar clique.

## Requisitos de destaque

- Destaque fino/moderado.
- Espessura com limite mínimo e máximo.
- Não cobrir textos.
- Não cobrir conectores.
- Não esconder o fio original.
- Se fio tiver listra, mostrar base + listra.
- A cor vem sempre de `parseWireColor`.

## Requisitos de cores

Implementar tabela oficial em `src/data/hyosung/wireColors.ts`.

Criar:

```ts
parseWireColor(code: string)
getWireRenderStyle(code: string)
```

Não criar cor aleatória para código desconhecido.

Código desconhecido deve retornar status seguro, como `unknown` ou `null`, e o dado deve ficar `pending_review`.

## Requisitos de editor de mapeamento

O editor é obrigatório.

Ele deve permitir:

- selecionar diagrama;
- selecionar página;
- criar fio;
- adicionar pontos;
- arrastar pontos;
- remover pontos;
- editar `colorCode`;
- editar origem/destino;
- editar conector/pino;
- editar `confidence`;
- editar `validationStatus`;
- exportar JSON;
- importar JSON;
- mostrar coordenadas normalizadas;
- ativar/desativar modo debug.

O objetivo é permitir mapear os fios com precisão sobre o PDF, não inventar mapeamento.

## Requisitos de modo debug

Ativação por:

- `?debugWires=true`;
- botão na UI;
- estado interno.

Mostrar:

- IDs de fios;
- IDs de conectores;
- pontos das polylines;
- bounding boxes;
- hit area;
- pageRect;
- overlayRect;
- canvas CSS size;
- canvas real size;
- zoom;
- pan;
- scale do PDF;
- devicePixelRatio;
- gap entre páginas;
- coordenada normalizada do cursor;
- coordenada de página do cursor;
- fio candidato mais próximo.

## Diagramas iniciais

Cadastrar os diagramas descritos em `docs/PDF_SOURCE_OF_TRUTH.md`.

Começar com:

- `gv250-ei-dspec-esquema`;
- `gv250-ei-dspec-manual`;
- `gt250r-ei-dspec-manual`;
- `gt250p-ei-dspec-manual`;
- `gt250-ei-dspec-manual`.

## Proibição contra dados falsos

Não declarar que todos os fios foram mapeados se isso não foi validado fio a fio.

Se a execução não der tempo de mapear tudo, entregue:

- infraestrutura correta;
- alguns exemplos `pending_review`;
- editor funcional;
- documentação clara;
- lista do que falta mapear.

## Testes obrigatórios

Criar testes para:

- cores simples;
- cores com listras;
- código desconhecido;
- conversão normalizado -> página;
- conversão página -> normalizado;
- distância ponto-segmento;
- distância ponto-polyline;
- seleção de fio mais próximo;
- clique fora de fio;
- fios paralelos próximos;
- bounding box de fio;
- bounding box de conector.

## Entrega final

A resposta final deve conter:

- arquivos criados/modificados;
- stack usada;
- como instalar;
- como rodar;
- como abrir PDFs;
- como ativar debug;
- como usar editor;
- onde editar dados de fios/conectores/cores;
- comandos executados;
- resultado dos testes;
- limitações;
- itens `pending_review`;
- próximos passos.
