# Checklist de validação

## PDFs

- [ ] `public/pdfs/Esquema_Eletrico_Hyosung.pdf` existe.
- [ ] `public/pdfs/Manual Hyosung delphi.pdf` existe.
- [ ] Viewer abre o PDF do esquema.
- [ ] Viewer abre o PDF do manual.
- [ ] Páginas relevantes aparecem.
- [ ] Numeração visual e índice interno estão documentados.

## Stitched view

- [ ] Páginas pareadas aparecem lado a lado.
- [ ] Gap padrão é 0px ou mínimo.
- [ ] Gap é controlado por uma constante.
- [ ] Não há margens acumuladas.
- [ ] A altura das páginas pareadas fica alinhada.
- [ ] A continuidade visual entre páginas pode ser inspecionada.

## PDF rendering

- [ ] Canvas renderiza com nitidez.
- [ ] Tamanho CSS do canvas é conhecido.
- [ ] Tamanho real do canvas é conhecido.
- [ ] `devicePixelRatio` é considerado.
- [ ] Escala do PDF.js é conhecida.
- [ ] Rotação da página é conhecida.
- [ ] Métricas aparecem no debug.

## Overlay

- [ ] Cada página tem SVG próprio.
- [ ] SVG tem mesma largura visual da página.
- [ ] SVG tem mesma altura visual da página.
- [ ] SVG compartilha origem X/Y com PDF.
- [ ] SVG não fica deslocado no scroll.
- [ ] SVG não fica deslocado no resize.
- [ ] SVG não fica deslocado após zoom.
- [ ] SVG não fica deslocado após pan.

## Coordenadas

- [ ] Ponto normalizado converte corretamente para página.
- [ ] Ponto de página converte corretamente para normalizado.
- [ ] Conversão ida/volta preserva valores esperados.
- [ ] Clique na tela converte para página correta.
- [ ] Clique em página 1 não afeta página 2.
- [ ] Clique em página 2 não afeta página 1.

## Seleção de fios

- [ ] Clique sobre fio mapeado seleciona fio correto.
- [ ] Clique fora de fio não seleciona nada.
- [ ] Fios paralelos próximos não geram seleção aleatória.
- [ ] Ambiguidade mostra candidatos.
- [ ] Hit area invisível funciona.
- [ ] Destaque visível é discreto.
- [ ] Seleção mantém alinhamento após zoom.
- [ ] Seleção mantém alinhamento após pan.
- [ ] Seleção mantém alinhamento após resize.

## Cores

- [ ] Código `B` vira Preto.
- [ ] Código `Gr` vira Cinza.
- [ ] Código `Br` vira Marrom.
- [ ] Código `BR` vira Preto com listras vermelhas.
- [ ] Código `WL` vira Branco com listras azuis.
- [ ] Código desconhecido não gera cor validada.
- [ ] Fio simples mostra cor base.
- [ ] Fio com listra mostra base e listra.

## Zoom e pan

- [ ] Zoom por botão.
- [ ] Zoom por roda.
- [ ] Pan por arraste.
- [ ] Reset.
- [ ] Fit width.
- [ ] Fit page.
- [ ] Fit diagram.
- [ ] Foco no fio.
- [ ] Foco no conector.
- [ ] Ponto sob cursor é mantido quando possível.

## Editor de mapeamento

- [ ] Criar fio.
- [ ] Adicionar ponto.
- [ ] Arrastar ponto.
- [ ] Remover ponto.
- [ ] Definir colorCode.
- [ ] Definir origem.
- [ ] Definir destino.
- [ ] Definir pino.
- [ ] Definir confidence.
- [ ] Definir validationStatus.
- [ ] Exportar JSON.
- [ ] Importar JSON.
- [ ] Ver coordenadas normalizadas.

## Debug

- [ ] Ativar por `?debugWires=true`.
- [ ] Ativar por botão.
- [ ] Mostrar IDs dos fios.
- [ ] Mostrar IDs dos conectores.
- [ ] Mostrar pontos.
- [ ] Mostrar bounding boxes.
- [ ] Mostrar hit areas.
- [ ] Mostrar pageRect.
- [ ] Mostrar overlayRect.
- [ ] Mostrar canvas size.
- [ ] Mostrar CSS size.
- [ ] Mostrar zoom/pan.
- [ ] Mostrar `devicePixelRatio`.
- [ ] Mostrar coordenada do cursor.

## Testes

- [ ] Testes de cores.
- [ ] Testes de coordenadas.
- [ ] Testes de distância.
- [ ] Testes de hit testing.
- [ ] Testes de bounding box.
- [ ] Testes de seleção.
- [ ] Build passa.
- [ ] Typecheck passa.
- [ ] Lint passa, se existir.
