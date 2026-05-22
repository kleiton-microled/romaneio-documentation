# Publicar no GitHub Pages (plano gratuito)

Repositório: **https://github.com/kleiton-microled/romaneio-documentation**

Site publicado: **https://kleiton-microled.github.io/romaneio-documentation/**

## Configuração no GitHub (uma vez)

1. Abra o repositório no GitHub.
2. **Settings** → **Pages**.
3. Em **Build and deployment** → **Source**, escolha **GitHub Actions**.
4. Faça push na branch `main` (ou rode o workflow manualmente em **Actions** → **Deploy GitHub Pages** → **Run workflow**).

Na primeira execução bem-sucedida, a URL do site aparece em **Settings → Pages** e no job **deploy** (environment `github-pages`).

## O que o workflow faz

Arquivo: `.github/workflows/deploy-pages.yml`

- Instala Python 3.12, MkDocs e Material
- Executa `mkdocs build` (usa `mkdocs.yml` e pasta `docs/`)
- Publica a pasta `site/` no GitHub Pages

Dispara em todo **push** na branch `main`.

## Desenvolvimento local

```powershell
.\setup-mkdocs-env.cmd   # primeira vez
.\serve.cmd              # http://127.0.0.1:8000
```

Git Bash: `./serve.sh`

## Atualizar o site

1. Edite os arquivos em `docs/guias-usuario/`.
2. Commit e push para `main`.
3. Aguarde o workflow **Deploy GitHub Pages** (Actions) ficar verde.
4. O site atualiza em alguns minutos (pode levar até ~10 min na primeira vez).

## Checklist

- [x] Repositório `kleiton-microled/romaneio-documentation`
- [x] `site_url` em `mkdocs.yml`
- [x] Workflow `deploy-pages.yml`
- [ ] **Settings → Pages → Source = GitHub Actions** (confirmar no navegador)
- [ ] Workflow verde em **Actions**

## GitHub CLI (`gh`)

Instalado via:

```powershell
winget install GitHub.cli --source winget
```

**Primeira vez** (no Git Bash ou PowerShell — feche e reabra o terminal após instalar):

```bash
gh auth login
```

Sugestões do assistente: **GitHub.com** → **HTTPS** → login pelo **navegador** (ou token).

Depois, integre ao Git:

```bash
gh auth setup-git
```

Teste:

```bash
gh auth status
gh repo view kleiton-microled/romaneio-documentation
```

Push com `gh` na pasta do repo:

```bash
git push origin main
```

## Problemas comuns

| Problema | Solução |
|----------|---------|
| 404 no site | Pages ainda não configurado como **GitHub Actions**; aguardar deploy verde |
| Build falha no CI | Rodar `mkdocs build` localmente e corrigir links/`nav` |
| Push com SSL | `git config --global http.sslBackend schannel` (Windows) |
| Repository not found | Criar repo ou corrigir `git remote` / permissões na org |
