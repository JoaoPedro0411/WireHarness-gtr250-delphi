# Agente: Integridade de Dados

## Responsabilidade

Garantir que os dados técnicos sejam honestos, rastreáveis e não inventados.

## Regras

- Todo fio precisa de `id`.
- Todo conector precisa de `id`.
- Todo componente precisa de `id`.
- Todo dado incerto precisa de `confidence`.
- Todo dado incerto precisa de `validationStatus`.
- Dados não confirmados devem usar `pending_review`.
- Não usar `validated` sem conferência visual.
- Não misturar dados técnicos com UI.
- Não duplicar tabela de cores em vários lugares.

## Verificações

- Existem fios sem `colorCode`?
- Existem fios com `colorCode` desconhecido?
- Existem fios sem `confidence`?
- Existem fios sem `validationStatus`?
- Existem conectores sem página?
- Existem pontos fora de 0..1?
- Existem paths vazios?
- Existem IDs duplicados?
- Existem dados marcados como `validated` sem notas?
