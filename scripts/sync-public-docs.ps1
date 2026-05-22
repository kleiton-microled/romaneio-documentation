#Requires -Version 5.1
<#
  Copia apenas os guias do usuario para docs-public/ (build publico).
  Nao copia APIs, schema, infra, etc.

  Uso (na raiz do repo):
    .\scripts\sync-public-docs.ps1
#>
$ErrorActionPreference = 'Stop'

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$SrcGuias = Join-Path $RepoRoot 'docs\guias-usuario'
$DstGuias = Join-Path $RepoRoot 'docs-public\guias-usuario'

if (-not (Test-Path $SrcGuias)) {
    throw "Pasta nao encontrada: $SrcGuias"
}

New-Item -ItemType Directory -Path $DstGuias -Force | Out-Null

Copy-Item -Path (Join-Path $SrcGuias '*') -Destination $DstGuias -Recurse -Force

# Ajustar link "voltar" no README publico (sem visao-geral privada)
$readme = Join-Path $DstGuias 'README.md'
if (Test-Path $readme) {
    $content = Get-Content $readme -Raw -Encoding UTF8
    $content = $content -replace '\[Voltar ao índice\]\(\.\./visao-geral\.md\)', '[Início](../index.md)'
    Set-Content -Path $readme -Value $content -Encoding UTF8 -NoNewline
}

Write-Host "OK: guias sincronizados em docs-public/guias-usuario/" -ForegroundColor Green
Write-Host "Build publico: mkdocs build -f mkdocs.public.yml" -ForegroundColor Cyan
