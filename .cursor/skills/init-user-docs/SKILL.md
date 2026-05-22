---
name: init-user-docs
description: >-
  Creates or updates end-user screen guides (step-by-step, validations, test scripts) in a MkDocs
  repo. Use when the user asks for user documentation, operator guide, how to test a screen,
  or init-user-docs for a controller/screen. Does NOT create API, schema, or technical docs.
disable-model-invocation: true
---

# Guias do usuário (MkDocs)

Scaffold e conteúdo de **documentação para operador/testador** — um guia por tela.

## Parâmetros

- **NOME_DO_PROJETO** (obrigatório): ex. `Romaneio`.
- **TELA** (obrigatório para novo guia): nome legível ou controller, ex. `MovimentacaoCSController`, `InventarioCargaSoltaArmazem`.
- **SLUG_DO_REPO** (opcional): default `{nome}-guias` ou manter repo existente `romaneio-documentation`.

Se faltar TELA: perguntar qual tela documentar.

## O que NÃO fazer

- Não criar pastas `apis/`, `fluxos/`, `arquitetura/`, `database/`, `INFRA-HANDOFF.md`, `json-data/`.
- Não documentar endpoints HTTP, SQL, deploy ou arquitetura neste repositório.
- Não duplicar texto entre guias — um arquivo por tela.

## Fluxo do agente

1. Confirmar NOME_DO_PROJETO e TELA (e repo existente vs novo).
2. Se repo novo: criar estrutura mínima abaixo; se existente: só adicionar/atualizar guia.
3. Ler no código-fonte: `Controller`, `Views/{Tela}/`, JavaScript da view, mensagens `TempData` e validações server-side.
4. Escrever `docs/guias-usuario/{NomeTela}.md` com as seções obrigatórias (template abaixo).
5. Atualizar `docs/guias-usuario/README.md` e `mkdocs.yml` `nav` (uma entrada por guia).
6. Atualizar `docs/index.md` tabela de telas.
7. Rodar `.\setup-mkdocs-env.cmd` ou `mkdocs build` — corrigir links quebrados (`strict: true`).
8. Resumir: arquivo criado, como preview (`serve.cmd`), próximas telas [TODO].

## Estrutura do repositório

```
{SLUG}/
├── mkdocs.yml              # site_name: "{NOME} – Guias do Usuário"
├── README.md
├── setup-mkdocs-env.cmd
├── serve.cmd / serve.sh
├── requirements.txt
├── docs/
│   ├── index.md
│   ├── GITHUB_PAGES_SETUP.md
│   └── guias-usuario/
│       ├── README.md
│       └── {NomeTela}.md
└── .cursor/skills/
    ├── init-user-docs/SKILL.md
    └── setup-mkdocs-env/SKILL.md
```

## Template — `docs/guias-usuario/{NomeTela}.md`

```markdown
# Guia do usuário — {Título da tela}

| | |
|---|---|
| **Menu** | {caminho no Home/menu} |
| **URL** | `{/Controller/Action}` |
| **Objetivo** | {uma frase de negócio} |

## Pré-requisitos
- Login, pátio, permissões — só o que o usuário precisa saber

## Visão da tela
- Blocos/campos principais (linguagem de interface)

## Fluxo completo (passo a passo)
- Lista numerada + diagrama mermaid opcional
- Ramificações (ex. importação vs exportação) se existirem no código

## Validações
### Na interface
### No servidor (mensagens exatas do código)

## Telas auxiliares / modais
- Se houver partials, novas abas, AJAX

## Como testar
### Ambiente
### Dados sugeridos (sem inventar códigos reais — [TODO] homologação)
### Roteiro T01, T02, …
### Verificação esperada (mensagem na tela; opcional SQL só se já existir no guia legado)

## Observações para testadores
- Lacunas ou bugs suspeitos encontrados na leitura do código
```

Preencher com dados **reais** extraídos do código; usar `[TODO]` apenas onde faltar dado de homologação.

## mkdocs.yml

```yaml
site_name: {NOME_DO_PROJETO} – Guias do Usuário
site_description: Passo a passo para operar e testar as telas
nav:
  - Início: index.md
  - Guias por tela:
      - Índice: guias-usuario/README.md
      - {Título}: guias-usuario/{NomeTela}.md
  - Publicar no GitHub: GITHUB_PAGES_SETUP.md
```

## Invocação

- "Use init-user-docs para MovimentacaoCSController"
- "Crie guia do usuário para a tela de inventário armazém"
- "Atualize o guia de Movimentação CS com as validações atuais"

## Relacionado

- `setup-mkdocs-env` — instalar Python/MkDocs na máquina do usuário
