# Instruções de revisão de código

## Verificar sempre

- O overlay continua preso ao PDF?
- Há coordenadas absolutas persistidas por engano?
- Existem cálculos geométricos duplicados em componentes?
- As funções puras têm testes?
- A cor vem de `parseWireColor`?
- Código desconhecido de cor é tratado com segurança?
- Hit area invisível está separada do destaque?
- Dados incertos estão como `pending_review`?
- O editor salva coordenadas normalizadas?
- O debug mostra métricas suficientes?
- O README/documentação foi atualizado?
- Build/test foram executados?

## Bloquear se encontrar

- Mapeamento inventado.
- `validated` sem validação.
- Overlay global desalinhável.
- Zoom aplicado só ao PDF.
- Zoom aplicado só ao overlay.
- Cores hardcoded fora da tabela oficial.
- Fios com listra tratados como cor única arbitrária.
- Seleção por grupo em vez de fio individual.
