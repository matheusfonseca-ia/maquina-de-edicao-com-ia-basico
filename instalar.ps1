# Sem argumento: instala somente o pacote desta pasta.
# No repositorio de desenvolvimento: -Pacote order-bump instala o complemento.
param([ValidateSet('principal', 'order-bump')][string]$Pacote = 'principal')
$ErrorActionPreference = 'Stop'
$pastaPacote = $PSScriptRoot
if ($Pacote -eq 'order-bump') { $pastaPacote = Join-Path $PSScriptRoot 'order-bump' }
$manifesto = Get-Content -LiteralPath (Join-Path $pastaPacote 'pacote.json') -Raw -Encoding UTF8 | ConvertFrom-Json
$origem = Join-Path $pastaPacote '.claude/skills'
$destino = Join-Path $env:USERPROFILE '.claude/skills'
$backup = Join-Path $env:USERPROFILE ('.claude/skills-backup/' + (Get-Date -Format 'yyyy-MM-dd_HH-mm-ss') + '-' + [guid]::NewGuid().ToString('N').Substring(0, 8))
if ($manifesto.requerMotor -and -not (Test-Path -LiteralPath (Join-Path $destino 'maquina-de-edicao/SKILL.md'))) {
    throw 'Instale primeiro o pacote principal da Maquina de Edicao. Depois rode este instalador de novo.'
}
# Confira tudo antes de substituir qualquer skill.
foreach ($nome in $manifesto.skills) {
    if ($nome -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$') { throw "Nome de skill invalido: $nome" }
    if (-not (Test-Path -LiteralPath (Join-Path $origem "$nome/SKILL.md"))) { throw "Skill ausente no pacote: $nome" }
}
New-Item -ItemType Directory -Force -Path $destino | Out-Null
$fezBackup = $false
foreach ($nome in $manifesto.skills) {
    $alvo = Join-Path $destino $nome
    if (Test-Path -LiteralPath $alvo) {
        $alvoResolvido = [IO.Path]::GetFullPath($alvo)
        $raizResolvida = [IO.Path]::GetFullPath($destino).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
        if (-not $alvoResolvido.StartsWith($raizResolvida, [StringComparison]::OrdinalIgnoreCase)) { throw 'Destino fora da pasta de skills.' }
        New-Item -ItemType Directory -Force -Path $backup | Out-Null
        Move-Item -LiteralPath $alvoResolvido -Destination (Join-Path $backup $nome)
        $fezBackup = $true
    }
    Copy-Item -LiteralPath (Join-Path $origem $nome) -Destination $alvo -Recurse
    Write-Host "  ok  /$nome"
}
Write-Host "Pronto! $($manifesto.skills.Count) skills instaladas ($($manifesto.id))." -ForegroundColor Green
if ($fezBackup) { Write-Host "As versoes antigas foram guardadas em $backup" }
Write-Host 'Feche e abra o Claude Code. Na pasta do seu video, digite /maquina-de-edicao ou o comando do formato.'
