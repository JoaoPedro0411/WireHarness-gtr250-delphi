# Status de mapeamento

## Estado inicial

```yaml
pdf_files:
  esquema_eletrico_hyosung: pending_verification
  manual_hyosung_delphi: pending_verification

pdf_rendering: pending
stitched_view: pending
overlay_alignment: pending
zoom_pan: pending
debug_mode: pending
mapping_editor: pending

color_table: ready_to_implement
wire_color_parser: pending
wire_render_style: pending

components:
  gv250_ei_dspec_esquema: pending_review
  gv250_ei_dspec_manual: pending_review
  gt250r_ei_dspec_manual: pending_review
  gt250p_ei_dspec_manual: pending_review
  gt250_ei_dspec_manual: pending_review

connectors: pending_review
pins: pending_review
wires: pending_review
wire_paths: pending_review
page_continuity: pending_review
```

## Convenções

- `validated`: conferido visualmente sobre o PDF.
- `needs_adjustment`: existe, mas precisa ajuste.
- `pending_review`: ainda não confirmado.
- `unknown`: não identificado.
- `not_applicable`: não se aplica.

## Regra para `validated`

Só usar `validated` se:

1. o fio/conector foi conferido no PDF;
2. o overlay está alinhado em zoom padrão;
3. o overlay está alinhado em zoom ampliado;
4. pan não desloca;
5. resize não desloca;
6. cor está correta conforme sigla;
7. origem/destino estão confirmados ou explicitamente nulos.

## Mapeamento inicial recomendado

Começar validando poucos elementos para testar a infraestrutura:

1. um componente simples;
2. um conector pequeno;
3. um fio curto;
4. um fio com listra;
5. um fio próximo de outros;
6. um fio que cruza página, se possível.

Não mapear todos os fios antes de validar o sistema de coordenadas.
