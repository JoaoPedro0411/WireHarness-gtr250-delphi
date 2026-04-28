# Notas de extração dos PDFs

## Princípios

- O PDF é a fonte de verdade visual.
- Extração de texto pode conter erros.
- OCR pode conter erros.
- Detecção automática de linhas pode conter erros.
- Nenhum dado deve virar `validated` sem conferência visual.
- Dados incertos devem ficar como `pending_review`.

## Fluxo correto de extração

1. Renderizar a página.
2. Extrair texto quando possível.
3. Identificar componentes visualmente.
4. Criar conectores preliminares.
5. Criar fios preliminares.
6. Traçar fios no editor sobre o PDF.
7. Associar cor conforme sigla.
8. Associar origem/destino quando visível.
9. Validar fio por fio.
10. Exportar JSON.

## Cores oficiais dos fios

### Cores simples

| Código | Significado |
|---|---|
| B | Preto |
| Gr | Cinza |
| Sb | Azul claro |
| L | Azul |
| Lg | Verde claro |
| W | Branco |
| Br | Marrom |
| O | Laranja |
| Y | Amarelo |
| G | Verde |
| R | Vermelho |

### Cores com listras

| Código | Significado |
|---|---|
| BL | Preto com listras azuis |
| BBr | Preto com listras marrons |
| BG | Preto com listras verdes |
| BO | Preto com listras laranja |
| BR | Preto com listras vermelhas |
| BW | Preto com listras brancas |
| BY | Preto com listras amarelas |
| LB | Azul com listras pretas |
| LG | Azul com listras verdes |
| LR | Azul com listras vermelhas |
| LW | Azul com listras brancas |
| LY | Azul com listras amarelas |
| BrB | Marrom com listras pretas |
| BrW | Marrom com listras brancas |
| GB | Verde com listras pretas |
| GR | Verde com listras vermelhas |
| GY | Verde com listras amarelas |
| GrB | Cinza com listras pretas |
| GrR | Cinza com listras vermelhas |
| GrW | Cinza com listras brancas |
| OB | Laranja com listras pretas |
| OL | Laranja com listras azuis |
| OG | Laranja com listras verdes |
| OR | Laranja com listras vermelhas |
| OW | Laranja com listras brancas |
| OY | Laranja com listras amarelas |
| RB | Vermelho com listras pretas |
| RW | Vermelho com listras brancas |
| WB | Branco com listras pretas |
| WL | Branco com listras azuis |
| WR | Branco com listras vermelhas |
| YB | Amarelo com listras pretas |
| YL | Amarelo com listras azuis |
| YG | Amarelo com listras verdes |
| YR | Amarelo com listras vermelhas |

## Abreviações técnicas relevantes

- ECU: unidade de controle do motor/injeção eletrônica.
- EI: injeção eletrônica de combustível/injetor eletrônico.
- FP: bomba de combustível.
- IG: ignição.
- Interruptor GP: interruptor da posição da transmissão.
- Interruptor RO: interruptor de queda.
- Sensor ET: sensor da temperatura do motor.
- Sensor IAP: sensor da pressão do ar de admissão.
- Sensor IAT: sensor da temperatura do ar de admissão.
- Sensor O2: sensor de oxigênio.
- Sensor TP: sensor da posição do acelerador.
- Solenoide ISC: controle de marcha lenta.

## Componentes iniciais para cadastrar

### GV250 EI D spec

- sensor de velocidade;
- velocímetro;
- tacômetro;
- indicador de combustível;
- interruptores do lado direito da manopla;
- parada do motor;
- pisca-alerta;
- partida;
- interruptor do freio dianteiro;
- interruptor de ignição;
- filtro #1;
- interruptor da alavanca da embreagem;
- bobina de ignição No.2;
- luz de seta dianteira direita;
- farol;
- luz de posição;
- luz de seta dianteira esquerda;
- interruptores da manopla esquerda;
- buzina;
- filtro #2;
- bobina de ignição No.1;
- sensor TP;
- sensor IAT;
- interruptor RO;
- solenoide ISC;
- diodo #2;
- injetor de combustível No.1;
- injetor de combustível No.2;
- sensor ET;
- terra do chassi;
- diodo #3;
- bomba de combustível;
- interruptor do freio traseiro;
- sensor de O2 No.1;
- relé do suporte lateral;
- relé do farol;
- relé das setas;
- relé principal;
- relé da bomba de combustível;
- sensor de O2 No.2;
- ECU;
- ECU J2 Preto;
- ECU J1 Cinza;
- interruptor GP;
- interruptor do suporte lateral;
- magneto;
- regulador/retificador;
- motor de partida;
- relé de partida;
- bateria;
- terra do motor;
- diodo #1;
- caixa de fusíveis 15 A;
- caixa de fusíveis 30 A;
- luz de seta traseira esquerda;
- luz da placa de licença;
- luz de freio e lanterna traseira;
- luz de seta traseira direita;
- ferramenta de diagnóstico.

## Status inicial

Nenhum fio deve iniciar como `validated`.

Estado recomendado:

```text
components: pending_review
connectors: pending_review
pins: pending_review
wires: pending_review
wire_paths: pending_review
colors: source_table_ready
pdf_pages: pending_verification
overlay_alignment: pending
```
