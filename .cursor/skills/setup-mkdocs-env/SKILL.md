---
name: setup-mkdocs-env
description: >-
  Installs Python (via winget if missing), creates a .venv, and installs mkdocs plus
  mkdocs-material for a MkDocs user-guides repo. Use when mkdocs build fails with
  command not found, the user asks to set up Python/pip/MkDocs, or before mkdocs serve
  on a new Windows machine.
disable-model-invocation: true
---

# Configurar ambiente MkDocs (Windows)

Automatiza instalação de **Python**, **pip** e **mkdocs-material** para repositórios de documentação (template MkDocs).

## Quando usar

- `pip` / `python` / `mkdocs` não reconhecidos no terminal
- Primeira vez no projeto `*-documentation`
- Usuário pede: "instalar Python para a documentação", "configurar mkdocs"

## O que executar

Na **raiz do repositório de documentação** (onde está `mkdocs.yml`):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\setup-mkdocs-env.ps1.txt
```

Atalho (duplo clique na raiz do repo):

```cmd
setup-mkdocs-env.cmd
```

(O launcher copia o script para `%TEMP%` com extensão `.ps1` — requisito do PowerShell.)

> O script está em `.ps1.txt` para evitar bloqueios de política em alguns ambientes; o `.cmd` invoca esse arquivo.

## Comportamento do script

1. Procura `py`, `python`, `python3` e caminhos padrão em `%LOCALAPPDATA%\Programs\Python\`.
2. Se não achar Python: `winget install Python.Python.3.12` (pode exigir UAC).
3. Cria `.venv` e instala `requirements.txt` (`mkdocs`, `mkdocs-material`).
4. Roda `mkdocs build` para validar (falha se `nav` estiver inconsistente).

Parâmetros opcionais:

| Flag | Efeito |
|------|--------|
| `-SkipBuild` | Não roda `mkdocs build` |
| `-UseGlobal` | `pip install --user` em vez de `.venv` |

## Após sucesso

Informar ao usuário:

```powershell
.\.venv\Scripts\Activate.ps1
mkdocs serve
```

URL: `http://127.0.0.1:8000`

## Se falhar

| Sintoma | Ação |
|---------|------|
| winget ausente | Pedir instalação manual: https://www.python.org/downloads/ (Add to PATH), depois rerodar o script |
| Python instalado mas não no PATH | Fechar/reabrir terminal; desativar aliases da Microsoft Store para `python.exe` |
| `Activate.ps1` bloqueado | `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` ou usar `.\.venv\Scripts\mkdocs.exe serve` |
| Build falha | Corrigir `mkdocs.yml` / arquivos em `nav` — não é problema de instalação |

## Agente: fluxo obrigatório

1. Identificar raiz do repo de docs (`mkdocs.yml` presente).
2. Executar o script via Shell (PowerShell); não apenas descrever os passos.
3. Se exit code ≠ 0, aplicar tabela de falhas acima e tentar uma vez após refresh de PATH (nova invocação do script).
4. Confirmar com `.\.venv\Scripts\mkdocs.exe --version` ou `mkdocs build`.
5. Resumir comandos de preview para o usuário.

## Repositórios sem script

Se o projeto de docs ainda não tiver `scripts/setup-mkdocs-env.ps1.txt`, copiar de `romaneio-documentation/scripts/` ou rodar equivalente:

```powershell
winget install Python.Python.3.12 -e --accept-package-agreements --accept-source-agreements
python -m venv .venv
.\.venv\Scripts\pip install mkdocs mkdocs-material
.\.venv\Scripts\mkdocs build
```

## Relacionado

- `init-user-docs` — criar/atualizar guias de tela para o usuário final
- `requirements.txt` — versões mínimas de MkDocs
