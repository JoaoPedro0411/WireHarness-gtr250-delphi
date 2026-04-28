# PDFs como fonte de verdade

## Arquivos

```text
public/pdfs/Esquema_Eletrico_Hyosung.pdf
public/pdfs/Manual Hyosung delphi.pdf
```

## 1. Esquema_Eletrico_Hyosung.pdf

Contém o diagrama elétrico `GV250 EI D spec` em duas páginas.

### Página 1

Função visual: metade esquerda/inicial do diagrama.

Componentes identificados visualmente/textualmente:

- Sensor de velocidade;
- Velocímetro;
- Tacômetro;
- Indicador de combustível;
- Interruptores do lado direito da manopla;
- Parada do motor;
- Pisca-alerta;
- Partida;
- Interruptor do freio dianteiro;
- Interruptor de ignição;
- Filtro #1;
- Interruptor da alavanca da embreagem;
- Bobina de ignição No.2;
- Luz de seta dianteira direita;
- Farol;
- Luz de posição;
- Luz de seta dianteira esquerda;
- Interruptores da manopla esquerda;
- Buzina;
- Filtro #2;
- Bobina de ignição No.1;
- Sensor TP;
- Sensor IAT;
- Interruptor RO;
- Solenoide ISC;
- Diodo #2;
- Injetor de combustível No.1;
- Injetor de combustível No.2;
- Sensor ET;
- Terra do chassi.

### Página 2

Função visual: metade direita/continuação do diagrama.

Componentes identificados:

- Diodo #3;
- Bomba de combustível;
- Indicador do combustível;
- Interruptor do freio traseiro;
- Sensor de O2 No.1;
- Relé do suporte lateral;
- Relé do farol;
- Relé das setas;
- Relé principal;
- Relé da bomba de combustível;
- Sensor de O2 No.2;
- ECU;
- ECU J2 Preto;
- ECU J1 Cinza;
- Interruptor GP;
- Interruptor do suporte lateral;
- Magneto;
- Regulador/retificador;
- Motor de partida;
- Relé de partida;
- Bateria;
- Terra do motor;
- Diodo #1;
- Caixa de fusíveis 15 A;
- Caixa de fusíveis 30 A;
- Luz de seta traseira esquerda;
- Luz da placa de licença;
- Luz de freio e lanterna traseira;
- Luz de seta traseira direita;
- Ferramenta de diagnóstico.

## 2. Manual Hyosung delphi.pdf

Manual de serviço do sistema de injeção Delphi para Mirage 250, Comet 250 e Comet 250R.

Páginas importantes:

- página 4: abreviações técnicas;
- página 5: tabela oficial de cores dos fios;
- páginas 113-114: GV250 EI D spec;
- páginas 115-116: GT250R EI D spec;
- páginas 117-118: GT250P EI D spec;
- páginas 119-120: GT250 EI D spec.

## Diagramas a cadastrar

### gv250-ei-dspec-esquema

```ts
{
  id: "gv250-ei-dspec-esquema",
  model: "GV250 EI",
  spec: "D spec",
  title: "GV250 EI D spec - Esquema elétrico",
  sourceDocumentId: "esquema-eletrico-hyosung",
  layout: "stitched-horizontal",
  pageGapPx: 0,
  pages: [
    { pageIndex: 0, sourcePdfPageNumber: 1, role: "left_half" },
    { pageIndex: 1, sourcePdfPageNumber: 2, role: "right_half" }
  ]
}
```

### gv250-ei-dspec-manual

```ts
{
  id: "gv250-ei-dspec-manual",
  model: "GV250 EI",
  spec: "D spec",
  title: "GV250 EI D spec - Manual",
  sourceDocumentId: "manual-hyosung-delphi",
  layout: "stitched-horizontal",
  pageGapPx: 0,
  pages: [
    { sourcePdfPageNumber: 113, role: "left_half" },
    { sourcePdfPageNumber: 114, role: "right_half" }
  ]
}
```

### gt250r-ei-dspec-manual

```ts
{
  id: "gt250r-ei-dspec-manual",
  model: "GT250R EI",
  spec: "D spec",
  title: "GT250R EI D spec - Manual",
  sourceDocumentId: "manual-hyosung-delphi",
  layout: "stitched-horizontal",
  pageGapPx: 0,
  pages: [
    { sourcePdfPageNumber: 115, role: "left_half" },
    { sourcePdfPageNumber: 116, role: "right_half" }
  ]
}
```

### gt250p-ei-dspec-manual

```ts
{
  id: "gt250p-ei-dspec-manual",
  model: "GT250P EI",
  spec: "D spec",
  title: "GT250P EI D spec - Manual",
  sourceDocumentId: "manual-hyosung-delphi",
  layout: "stitched-horizontal",
  pageGapPx: 0,
  pages: [
    { sourcePdfPageNumber: 117, role: "left_half" },
    { sourcePdfPageNumber: 118, role: "right_half" }
  ]
}
```

### gt250-ei-dspec-manual

```ts
{
  id: "gt250-ei-dspec-manual",
  model: "GT250 EI",
  spec: "D spec",
  title: "GT250 EI D spec - Manual",
  sourceDocumentId: "manual-hyosung-delphi",
  layout: "stitched-horizontal",
  pageGapPx: 0,
  pages: [
    { sourcePdfPageNumber: 119, role: "left_half" },
    { sourcePdfPageNumber: 120, role: "right_half" }
  ]
}
```

## Atenção sobre numeração de páginas

A numeração visual impressa no manual pode não coincidir com o índice zero-based do PDF.

A aplicação deve suportar campos separados:

- `sourcePdfPageNumber`: página visual/usuário;
- `pdfIndex`: índice zero-based usado internamente;
- `pageIndex`: índice da página dentro do diagrama.

Não assumir automaticamente que página impressa = índice do PDF.
