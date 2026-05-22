# Publicar os guias no GitHub Pages

Este repositório é voltado a **guias do usuário** e pode ficar **público** no GitHub sem expor documentação técnica interna.

## MkDocs + GitHub Pages

```bash
pip install mkdocs mkdocs-material
mkdocs build
```

Publicar a pasta `site/` com Actions (`peaceiris/actions-mkdocs-material`) ou `mkdocs gh-deploy`.

Ajuste em `mkdocs.yml`:

```yaml
site_url: https://SEU-USUARIO.github.io/romaneio-documentation/
```

## Desenvolvimento local

Na raiz do repositório:

```powershell
.\setup-mkdocs-env.cmd   # primeira vez
.\serve.cmd              # preview
```

Git Bash: `./serve.sh`

Abrir http://127.0.0.1:8000

## Checklist

- [ ] Repositório criado no GitHub (pode ser **público**)
- [ ] `site_url` atualizado
- [ ] Workflow de deploy configurado
- [ ] `mkdocs build` sem erros
