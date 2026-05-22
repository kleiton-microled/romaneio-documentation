# Índice dos guias

Um arquivo por tela. Cada guia contém:

- Objetivo e como acessar no menu
- Fluxo passo a passo na interface
- Validações e mensagens exibidas
- Roteiro de testes (T01, T02, …)

| Tela | Arquivo | Status |
|------|---------|--------|
| Movimentação Carga Solta | [MovimentacaoCargaSolta.md](MovimentacaoCargaSolta.md) | Completo |
| Associação de Marcantes | [AssociacaoMarcantes.md](AssociacaoMarcantes.md) | Completo |
| Inventário Carga Solta Armazém | — | [TODO] |
| Consulta Liberação Carregamento | — | [TODO] |

[Voltar ao início](../index.md)

## Como contribuir

1. Abra o `.md` da tela ou peça ao agente (`init-user-docs`) para gerar a partir do controller.
2. Descreva o que o **usuário vê e faz** — evite detalhes de API/SQL neste repositório.
3. Rode `mkdocs build` na raiz antes de publicar.
