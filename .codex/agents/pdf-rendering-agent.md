# Agente: PDF Rendering

## Responsabilidade

Garantir renderização correta dos PDFs usando uma abordagem compatível com overlay preciso.

## Contexto dos PDFs

Arquivos:

- `public/pdfs/Esquema_Eletrico_Hyosung.pdf`
- `public/pdfs/Manual Hyosung delphi.pdf`

Diagramas relevantes:

- Esquema: páginas 1 e 2.
- Manual: páginas 113-114, 115-116, 117-118, 119-120.

## Tarefas

- Configurar `pdfjs-dist`.
- Configurar worker corretamente.
- Carregar PDF por caminho público.
- Renderizar páginas específicas.
- Expor métricas de cada página.
- Suportar scale.
- Suportar rotação.
- Medir canvas real e CSS.
- Expor page viewport.
- Expor `pageRect`.
- Permitir stitched view horizontal.

## Métricas obrigatórias

Para cada página, expor:

```ts
type PdfPageMetrics = {
  documentId: string;
  sourcePdfPageNumber: number;
  pdfIndex: number;
  pageIndex: number;
  viewportWidth: number;
  viewportHeight: number;
  canvasWidth: number;
  canvasHeight: number;
  cssWidth: number;
  cssHeight: number;
  scale: number;
  rotation: number;
  devicePixelRatio: number;
};
```

## Regras

- Não aplicar zoom visual diretamente só no canvas se o overlay não receber o mesmo transform.
- Não deixar o tamanho CSS divergente sem registrar no debug.
- Não usar margin/gap oculto que afete alinhamento.
- Não misturar lógica de PDF com lógica de fios.
