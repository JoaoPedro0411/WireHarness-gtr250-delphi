# Agente: Cores dos fios

## Responsabilidade

Implementar tabela oficial de cores dos fios e garantir renderização fiel.

## Fonte de verdade

Tabela oficial do manual.

## Cores simples

- B: Preto
- Gr: Cinza
- Sb: Azul claro
- L: Azul
- Lg: Verde claro
- W: Branco
- Br: Marrom
- O: Laranja
- Y: Amarelo
- G: Verde
- R: Vermelho

## Cores com listras

- BL: Preto com listras azuis
- BBr: Preto com listras marrons
- BG: Preto com listras verdes
- BO: Preto com listras laranja
- BR: Preto com listras vermelhas
- BW: Preto com listras brancas
- BY: Preto com listras amarelas
- LB: Azul com listras pretas
- LG: Azul com listras verdes
- LR: Azul com listras vermelhas
- LW: Azul com listras brancas
- LY: Azul com listras amarelas
- BrB: Marrom com listras pretas
- BrW: Marrom com listras brancas
- GB: Verde com listras pretas
- GR: Verde com listras vermelhas
- GY: Verde com listras amarelas
- GrB: Cinza com listras pretas
- GrR: Cinza com listras vermelhas
- GrW: Cinza com listras brancas
- OB: Laranja com listras pretas
- OL: Laranja com listras azuis
- OG: Laranja com listras verdes
- OR: Laranja com listras vermelhas
- OW: Laranja com listras brancas
- OY: Laranja com listras amarelas
- RB: Vermelho com listras pretas
- RW: Vermelho com listras brancas
- WB: Branco com listras pretas
- WL: Branco com listras azuis
- WR: Branco com listras vermelhas
- YB: Amarelo com listras pretas
- YL: Amarelo com listras azuis
- YG: Amarelo com listras verdes
- YR: Amarelo com listras vermelhas

## Tarefas

- Criar `src/data/hyosung/wireColors.ts`.
- Criar `parseWireColor(code)`.
- Criar `getWireRenderStyle(code)`.
- Testar todos os códigos.
- Retornar valor seguro para código desconhecido.
- Representar listras com base + listra.

## Regras

- Nunca escolher cor aleatória.
- Nunca validar código desconhecido.
- Código desconhecido deve aparecer como `pending_review`.
- Fio com listra não deve virar uma única cor arbitrária.
