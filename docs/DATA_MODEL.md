# Modelo de dados

## Princípios

Separar claramente:

1. dados extraídos do manual;
2. dados normalizados da aplicação;
3. estado do viewer;
4. componentes visuais;
5. dados de validação;
6. dados pendentes.

Não misturar dados técnicos diretamente dentro dos componentes React.

## Tipos base

```ts
export type Confidence =
  | "high"
  | "medium"
  | "low"
  | "pending_review";

export type ValidationStatus =
  | "validated"
  | "needs_adjustment"
  | "pending_review";

export type NormalizedPoint = {
  x: number; // 0 a 1, relativo à largura da página
  y: number; // 0 a 1, relativo à altura da página
};

export type PageRole =
  | "left_half"
  | "right_half"
  | "single";

export type DiagramLayout =
  | "stitched-horizontal"
  | "single-page"
  | "vertical";
```

## Documento fonte

```ts
export type SourceDocument = {
  id: string;
  title: string;
  fileName: string;
  publicPath: string;
  pageCount?: number;
  notes?: string;
};
```

## Página do diagrama

```ts
export type DiagramPage = {
  pageIndex: number;
  sourceDocumentId: string;
  sourcePdfPageNumber: number;
  pdfIndex?: number;
  label: string;
  role: PageRole;
};
```

## Diagrama

```ts
export type Diagram = {
  id: string;
  model: string;
  spec: string;
  title: string;
  pages: DiagramPage[];
  layout: DiagramLayout;
  pageGapPx: number;
};
```

## Cor do fio

```ts
export type WireColor = {
  code: string;
  label: string;
  baseColorName: string;
  stripeColorName?: string;
  baseColorCss: string;
  stripeColorCss?: string;
  hasStripe: boolean;
};
```

## Caminho do fio

```ts
export type WirePath = {
  pageIndex: number;
  points: NormalizedPoint[];
};
```

## Fio

```ts
export type Wire = {
  id: string;
  diagramId: string;
  label: string;

  colorCode: string;
  colorLabel: string;
  baseColorCss: string;
  stripeColorCss?: string;
  hasStripe: boolean;

  sourceConnectorId?: string | null;
  sourcePin?: string | null;
  targetConnectorId?: string | null;
  targetPin?: string | null;

  paths: WirePath[];

  continuityGroupId?: string | null;

  confidence: Confidence;
  validationStatus: ValidationStatus;

  notes?: string;

  source?: {
    documentId: string;
    sourcePdfPageNumber?: number;
    extractionMethod: "manual" | "assisted" | "text_extraction" | "visual";
    reviewedByHuman: boolean;
  };
};
```

## Pino do conector

```ts
export type ConnectorPin = {
  pin: string;
  wireId?: string | null;
  colorCode?: string | null;
  confidence: Confidence;
  validationStatus: ValidationStatus;
  notes?: string;
};
```

## Conector

```ts
export type Connector = {
  id: string;
  diagramId: string;
  pageIndex: number;
  label: string;
  componentName: string;

  position: NormalizedPoint;

  boundingBox?: {
    x: number;
    y: number;
    width: number;
    height: number;
  };

  pins: ConnectorPin[];

  confidence: Confidence;
  validationStatus: ValidationStatus;
  notes?: string;
};
```

## Componente

```ts
export type ElectricalComponent = {
  id: string;
  diagramId: string;
  pageIndex: number;
  name: string;
  label: string;
  type:
    | "sensor"
    | "switch"
    | "relay"
    | "ecu"
    | "fuse"
    | "lamp"
    | "ground"
    | "diode"
    | "motor"
    | "battery"
    | "connector"
    | "other";
  position?: NormalizedPoint;
  boundingBox?: {
    x: number;
    y: number;
    width: number;
    height: number;
  };
  connectorIds: string[];
  confidence: Confidence;
  validationStatus: ValidationStatus;
  notes?: string;
};
```

## Continuidade entre páginas

```ts
export type PageContinuation = {
  id: string;
  diagramId: string;
  fromPageIndex: number;
  toPageIndex: number;
  fromEdge: "left" | "right" | "top" | "bottom";
  toEdge: "left" | "right" | "top" | "bottom";
  laneIndex?: number;
  candidateWireIds: string[];
  confidence: Confidence;
  validationStatus: ValidationStatus;
  notes?: string;
};
```

## Estado do viewer

```ts
export type ViewerTransform = {
  zoom: number;
  panX: number;
  panY: number;
};

export type ViewerState = {
  selectedDiagramId: string;
  selectedWireId?: string | null;
  selectedConnectorId?: string | null;
  transform: ViewerTransform;
  debugEnabled: boolean;
  mappingEditorEnabled: boolean;
};
```

## Funções puras obrigatórias

```ts
parseWireColor(code: string): WireColor | null;

getWireRenderStyle(code: string): {
  stroke: string;
  stripeStroke?: string;
  hasStripe: boolean;
};

normalizedToPagePoint(
  point: NormalizedPoint,
  pageSize: { width: number; height: number }
): { x: number; y: number };

pageToNormalizedPoint(
  point: { x: number; y: number },
  pageSize: { width: number; height: number }
): NormalizedPoint;

screenToPagePoint(
  point: { x: number; y: number },
  pageRect: DOMRect | { left: number; top: number; width: number; height: number },
  transform: ViewerTransform
): { x: number; y: number };

pageToScreenPoint(
  point: { x: number; y: number },
  pageRect: DOMRect | { left: number; top: number; width: number; height: number },
  transform: ViewerTransform
): { x: number; y: number };

getDistanceFromPointToSegment(
  point: { x: number; y: number },
  a: { x: number; y: number },
  b: { x: number; y: number }
): number;

getDistanceFromPointToPolyline(
  point: { x: number; y: number },
  polyline: Array<{ x: number; y: number }>
): number;

findNearestWire(clickPoint, wires, tolerance): Wire | null;

findCandidateWires(clickPoint, wires, tolerance): Wire[];

getWireBoundingBox(wire: Wire): BoundingBox;

getConnectorBoundingBox(connector: Connector): BoundingBox;
```
