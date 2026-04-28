# Contexto do projeto

## Objetivo

Criar uma aplicação Node.js/TypeScript para visualizar diagramas elétricos Hyosung em PDF com overlay interativo preciso para fios, conectores, pinos e componentes.

A aplicação deve permitir inspeção técnica confiável do diagrama.

## Problema a resolver

Diagramas elétricos em PDF são difíceis de navegar porque:

- há muitos fios paralelos;
- há cruzamentos;
- há conectores densos;
- as cores aparecem por siglas;
- o diagrama é dividido em páginas;
- acompanhar continuidade entre páginas é difícil;
- zoom padrão de PDF não ajuda na seleção de fios;
- uma sobreposição mal alinhada torna a ferramenta inútil.

## Solução esperada

Renderizar o PDF original e criar overlay interativo por cima.

O overlay deve permitir:

- seleção individual de fio;
- destaque discreto;
- cor fiel à sigla;
- representação de listras;
- detalhes de origem/destino;
- busca por conector;
- busca por cor;
- busca por fio;
- foco no fio/conector;
- edição de mapeamento;
- debug visual.

## Requisitos não negociáveis

- O PDF é a fonte visual principal.
- O overlay precisa ficar alinhado.
- A seleção é por fio individual.
- Dados incertos não devem ser inventados.
- Deve haver modo de mapear manualmente os fios.
- Deve haver modo debug.
- Deve haver testes de geometria e cor.

## Stack preferida

- Node.js;
- TypeScript;
- React;
- Vite;
- `pdfjs-dist`;
- SVG;
- Vitest.

## Escopo atual

Somente os PDFs fornecidos:

- `Esquema_Eletrico_Hyosung.pdf`;
- `Manual Hyosung delphi.pdf`.

## O que não fazer agora

- Não tentar construir uma plataforma genérica para qualquer manual.
- Não redesenhar o diagrama inteiro como substituto do PDF.
- Não usar IA/OCR como fonte final sem validação.
- Não declarar todos os fios mapeados sem validação.
- Não criar UI sofisticada antes da precisão.
