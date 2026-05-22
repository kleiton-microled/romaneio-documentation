# Romaneio – Guias do Usuário

Repositório de **guias operacionais** do sistema Romaneio (MkDocs Material): passo a passo por tela, validações e roteiros de teste.

**Não contém** documentação técnica (API, schema, infra). Apenas material para operador e testador.

## Ambiente (Windows)

```powershell
.\setup-mkdocs-env.cmd
.\serve.cmd
```

Abra http://127.0.0.1:8000 — índice em [docs/index.md](docs/index.md).

## Conteúdo

| Pasta | Uso |
|-------|-----|
| `docs/guias-usuario/` | Um `.md` por tela |

## Skills Cursor

| Skill | Uso |
|-------|-----|
| `setup-mkdocs-env` | Instalar Python + MkDocs |
| `init-user-docs` | Criar ou atualizar guia de uma tela a partir do código |

Exemplo: *"Use init-user-docs para documentar InventarioCargaSoltaArmazemController"*.

## Publicação

Ver [docs/GITHUB_PAGES_SETUP.md](docs/GITHUB_PAGES_SETUP.md).
