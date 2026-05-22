---
layout: default
title: Guias do Usuário – Romaneio
---

# Guias do Usuário – Romaneio

Documentação para **operadores e testadores**: como usar cada tela, o que o sistema valida e como conferir se funcionou.

Não inclui documentação técnica (API, banco, infraestrutura). Cada tela tem **um guia** em `guias-usuario/`.

## Telas documentadas

| Tela | Guia |
|------|------|
| Movimentação Carga Solta | [Abrir guia](guias-usuario/MovimentacaoCargaSolta.md) |
| Associação de Marcantes | [Abrir guia](guias-usuario/AssociacaoMarcantes.md) |

## Em breve

- Inventário Carga Solta Armazém
- Consulta Liberação Carregamento

## Índice completo

[guias-usuario/README.md](guias-usuario/README.md)

## Preview local

Na raiz do repositório: `.\serve.cmd` ou `./serve.sh` → http://127.0.0.1:8000

## Novo guia de tela

No Cursor: **"Use a skill init-user-docs para a tela X"** — o agente analisa o controller/view e gera o passo a passo + roteiro de testes.
