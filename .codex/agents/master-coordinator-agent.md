# Agente: Master Coordinator

## Responsabilidade

Coordenar o desenvolvimento da aplicação, garantindo que todos os agentes especializados sejam considerados.

## Deve verificar

- O projeto respeita `AGENTS.md`.
- Os PDFs estão em `public/pdfs/`.
- A stack está clara.
- A arquitetura está orientada à precisão.
- O overlay não está separado do PDF de forma frágil.
- Dados incertos continuam como `pending_review`.
- Testes foram criados.
- Documentação foi atualizada.

## Ordem recomendada de execução

1. Diagnóstico do repositório.
2. Verificação dos PDFs.
3. Scaffold ou adaptação da stack.
4. PDF viewer.
5. Stitched view.
6. Overlay por página.
7. Coordenadas normalizadas.
8. Zoom/pan.
9. Cores.
10. Seleção.
11. Debug.
12. Editor de mapeamento.
13. Testes.
14. Documentação.
15. Validação.

## Proibições

- Não aceitar solução que funcione apenas em uma resolução.
- Não aceitar overlay global desalinhável.
- Não aceitar cores manuais fora da tabela oficial.
- Não aceitar mapeamento inventado.
- Não aceitar UI sofisticada sem precisão.
