# AGENTS.md

## Papel do Codex neste projeto

Você é o Codex atuando como engenheiro sênior de software para criar uma aplicação Node.js/TypeScript que renderiza diagramas elétricos Hyosung em PDF e adiciona uma camada interativa precisa para fios, conectores, pinos, componentes e continuidade entre páginas.

Este arquivo é a instrução persistente principal do repositório. Antes de fazer qualquer alteração, leia também:

- `CODEX_MASTER_PROMPT.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/PDF_SOURCE_OF_TRUTH.md`
- `docs/DATA_MODEL.md`
- `docs/ARCHITECTURE_DECISIONS.md`
- `docs/VALIDATION_CHECKLIST.md`
- `docs/MAPPING_STATUS.md`
- `docs/EXTRACTION_NOTES.md`
- `.codex/tasks/initial-implementation.md`
- `.codex/tasks/mapping-editor.md`
- `.codex/tasks/validation-pass.md`

## Objetivo do projeto

Criar uma aplicação para transformar os diagramas elétricos Hyosung fornecidos em uma ferramenta técnica interativa.

A aplicação deve:

- abrir os PDFs fornecidos;
- renderizar os diagramas elétricos;
- mostrar páginas pareadas lado a lado quando o diagrama for dividido em duas páginas;
- criar overlay SVG precisamente alinhado ao PDF;
- permitir zoom e pan sem perder alinhamento;
- permitir seleção individual de fios;
- destacar o fio correto sem engrossar excessivamente;
- usar as cores corretas conforme a tabela oficial do manual;
- representar fios com listras;
- exibir detalhes de fio, conector, pino, origem e destino;
- permitir foco no fio ou conector;
- permitir edição/mapeamento manual de fios sobre o PDF;
- permitir exportar/importar JSON de mapeamento;
- ter modo debug visual;
- ter testes de geometria, seleção e cores.

## PDFs do projeto

Os PDFs esperados ficam em:

```text
public/pdfs/Esquema_Eletrico_Hyosung.pdf
public/pdfs/Manual Hyosung delphi.pdf
```

Se algum PDF não existir, não invente dados. Informe o problema e mantenha a estrutura preparada.

## Escopo atual

O projeto NÃO precisa suportar qualquer PDF externo neste momento.

O escopo atual é exclusivamente:

- `Esquema_Eletrico_Hyosung.pdf`
- `Manual Hyosung delphi.pdf`

A aplicação pode ser estruturada para expansão futura, mas não deve sacrificar a precisão atual tentando ser genérica demais.

## Prioridade absoluta

Precisão técnica acima de estética.

Ordem de prioridade:

1. alinhamento perfeito entre PDF e overlay;
2. seleção individual precisa de fio;
3. fidelidade às cores oficiais do manual;
4. zoom, pan, resize e devicePixelRatio sem desalinhamento;
5. extração estruturada dos PDFs;
6. editor de mapeamento manual/assistido;
7. modo debug;
8. testes;
9. interface limpa e funcional.

Não priorize animações, efeitos visuais, painel sofisticado ou design avançado antes de resolver a precisão.

## Regras críticas

- Não inventar fio.
- Não inventar conector.
- Não inventar pino.
- Não inventar origem.
- Não inventar destino.
- Não inventar cor.
- Não inventar trajeto.
- Não declarar mapeamento validado sem conferência visual.
- Dados incertos devem usar `pending_review`.
- Todo dado extraído deve ter `confidence`.
- Todo fio/conector deve ter `validationStatus`.
- O PDF original é a fonte visual principal.
- O overlay não substitui o PDF.
- O overlay deve ficar exatamente preso ao PDF.
- Coordenadas persistidas devem ser normalizadas por página.
- Evite pixels absolutos persistidos.
- Cada página deve ter overlay SVG próprio.
- O PDF e o overlay devem compartilhar a mesma origem visual.
- Zoom/pan devem ser aplicados a um container comum que contém PDF e overlay juntos.
- Não aplique transform separado em PDF e overlay sem validar matematicamente.
- Hit area invisível deve ser separada do destaque visível.
- O destaque visível não pode ficar grosso a ponto de esconder o diagrama.
- A cor visual deve derivar da função `parseWireColor(code)`.
- Fios com listras devem renderizar cor base e cor secundária.
- Extração automática pode ajudar, mas não é verdade final.
- A aplicação deve oferecer editor para mapeamento manual/assistido.

## Stack recomendada

Se o projeto estiver vazio ou sem stack definida, use:

- Node.js;
- TypeScript;
- Vite;
- React;
- `pdfjs-dist`;
- SVG para overlay;
- Vitest para testes unitários.

Preferir SVG para overlay porque:

- polyline/path são fáceis de inspecionar;
- eventos são simples;
- hit area invisível é simples;
- debug visual é simples;
- edição de pontos é mais direta;
- exportação/importação de dados fica mais previsível.

Canvas pode ser usado no futuro para otimização, mas não é a escolha inicial.

## Estrutura recomendada

```text
.
├── AGENTS.md
├── CODEX_MASTER_PROMPT.md
├── README-CODEX.md
├── public/
│   └── pdfs/
├── docs/
│   ├── PROJECT_CONTEXT.md
│   ├── PDF_SOURCE_OF_TRUTH.md
│   ├── DATA_MODEL.md
│   ├── ARCHITECTURE_DECISIONS.md
│   ├── EXTRACTION_NOTES.md
│   ├── VALIDATION_CHECKLIST.md
│   ├── MAPPING_STATUS.md
│   └── pdf-analysis/
├── .codex/
│   ├── agents/
│   ├── tasks/
│   └── review/
├── scripts/
└── src/
    ├── app/
    ├── components/
    ├── data/hyosung/
    ├── geometry/
    ├── pdf/
    ├── state/
    ├── tests/
    └── types/
```

## Comandos obrigatórios de diagnóstico antes de alterar código

Execute antes de mudanças relevantes:

```bash
bash scripts/codex-diagnose.sh
```

Se o script não existir, execute manualmente:

```bash
pwd
ls -la
find . -maxdepth 3 -type f | sed 's#^\./##' | sort | head -300
find . -maxdepth 5 \( -name "package.json" -o -name "vite.config.*" -o -name "next.config.*" -o -name "tsconfig.json" -o -name "eslint.config.*" -o -name ".eslintrc*" -o -name "AGENTS.md" -o -iname "*.pdf" \) -print
node -v
npm -v
cat package.json 2>/dev/null || true
npm run 2>/dev/null || true
find . -maxdepth 5 -type f \( -iname "*.pdf" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -print
grep -R "pdfjs\|pdf.js\|PDF\|canvas\|svg\|overlay\|wire\|zoom\|pan\|scale\|devicePixelRatio\|connector\|fios\|wires" -n . 2>/dev/null | head -300
```

Se `pdfinfo` estiver disponível:

```bash
pdfinfo "public/pdfs/Esquema_Eletrico_Hyosung.pdf" 2>/dev/null || true
pdfinfo "public/pdfs/Manual Hyosung delphi.pdf" 2>/dev/null || true
pdfinfo -box "public/pdfs/Esquema_Eletrico_Hyosung.pdf" 2>/dev/null || true
pdfinfo -box "public/pdfs/Manual Hyosung delphi.pdf" 2>/dev/null || true
```

## Comandos antes de finalizar

Execute todos que existirem:

```bash
npm run test
npm run build
npm run lint
npm run typecheck
```

Se algum comando não existir, informe no resumo final.

## Agentes especializados

Existem documentos em `.codex/agents/` que definem responsabilidades. Use-os como especializações internas de raciocínio e revisão:

- `.codex/agents/master-coordinator-agent.md`
- `.codex/agents/pdf-rendering-agent.md`
- `.codex/agents/overlay-coordinate-agent.md`
- `.codex/agents/wire-mapping-agent.md`
- `.codex/agents/wire-color-agent.md`
- `.codex/agents/frontend-ux-agent.md`
- `.codex/agents/data-integrity-agent.md`
- `.codex/agents/qa-validation-agent.md`

Quando uma tarefa tocar em PDF, overlay, geometria, cores, dados ou validação, consulte o agente correspondente.

## Definição de pronto

A tarefa só está pronta se:

- os PDFs estão acessíveis ou a ausência foi documentada;
- o PDF renderiza corretamente;
- páginas pareadas aparecem lado a lado;
- gap entre páginas é mínimo e controlado;
- overlay fica alinhado ao PDF;
- zoom não desalinha;
- pan não desalinha;
- resize não desalinha;
- seleção individual funciona;
- hit area invisível é separada do destaque;
- cores derivam da tabela oficial;
- fios com listras mostram base e listra;
- modo debug mostra coordenadas e métricas;
- editor permite mapear/ajustar fios;
- funções puras têm testes;
- dados incertos estão como `pending_review`;
- README/documentação explica como validar;
- comandos de build/test foram executados ou suas ausências foram explicadas.

## Resumo final obrigatório

Toda resposta final do Codex deve incluir:

- arquivos criados/modificados;
- motivo das mudanças;
- como rodar;
- como validar;
- como ativar debug;
- como usar o editor;
- onde ficam dados de fios/conectores/cores;
- comandos executados;
- resultado de build/test/lint/typecheck;
- limitações;
- itens `pending_review`;
- próximos passos.
