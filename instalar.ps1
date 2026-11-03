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

# Efeitos sonoros: a Maquina usa sempre o earshot (github.com/Leonxlnx/earshot).
# O pacote principal instala; o complemento so confere que ele existe.
$earshotRepo = 'https://github.com/Leonxlnx/earshot.git'
$earshotVersao = 'v0.4.0'
$earshotPasta = Join-Path $env:USERPROFILE '.maquina-de-edicao/earshot'
$earshotPython = Join-Path $earshotPasta '.venv/Scripts/python.exe'

function Find-Python310 {
    foreach ($candidato in @(@('py', '-3'), @('python'), @('python3'))) {
        if (-not (Get-Command $candidato[0] -ErrorAction SilentlyContinue)) { continue }
        $resto = @($candidato | Select-Object -Skip 1) + @('-c', 'import sys; print(int(sys.version_info >= (3, 10)))')
        try { $saida = & $candidato[0] @resto 2>$null } catch { continue }
        if ($LASTEXITCODE -eq 0 -and "$saida".Trim() -eq '1') { return ,$candidato }
    }
    return $null
}

function Invoke-Passo([string]$descricao, [scriptblock]$comando) {
    & $comando
    if ($LASTEXITCODE -ne 0) { throw "Falhou: $descricao. Corrija e rode este instalador de novo." }
}

if ($manifesto.requerMotor -and -not (Test-Path -LiteralPath (Join-Path $destino 'maquina-de-edicao/SKILL.md'))) {
    throw 'Instale primeiro o pacote principal da Maquina de Edicao. Depois rode este instalador de novo.'
}
if ($manifesto.requerMotor -and -not (Test-Path -LiteralPath $earshotPython)) {
    throw 'Falta o earshot (efeitos sonoros). Rode de novo o instalador do pacote principal e depois este.'
}
$python = $null
if (-not $manifesto.requerMotor) {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw 'Falta o Git. Instale com: winget install Git.Git  (depois feche e abra o terminal e rode este instalador de novo).'
    }
    $python = Find-Python310
    if (-not $python) {
        throw 'Falta o Python 3.10 ou mais novo. Instale com: winget install Python.Python.3.12  (depois feche e abra o terminal e rode este instalador de novo).'
    }
}
# Confira tudo antes de substituir qualquer skill.
foreach ($nome in $manifesto.skills) {
    if ($nome -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$') { throw "Nome de skill invalido: $nome" }
    if (-not (Test-Path -LiteralPath (Join-Path $origem "$nome/SKILL.md"))) { throw "Skill ausente no pacote: $nome" }
}
New-Item -ItemType Directory -Force -Path $destino | Out-Null
$fezBackup = $false
function Install-Skill([string]$nome, [string]$pastaOrigem) {
    $alvo = Join-Path $destino $nome
    if (Test-Path -LiteralPath $alvo) {
        $alvoResolvido = [IO.Path]::GetFullPath($alvo)
        $raizResolvida = [IO.Path]::GetFullPath($destino).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
        if (-not $alvoResolvido.StartsWith($raizResolvida, [StringComparison]::OrdinalIgnoreCase)) { throw 'Destino fora da pasta de skills.' }
        New-Item -ItemType Directory -Force -Path $backup | Out-Null
        Move-Item -LiteralPath $alvoResolvido -Destination (Join-Path $backup $nome)
        $script:fezBackup = $true
    }
    Copy-Item -LiteralPath $pastaOrigem -Destination $alvo -Recurse
    Write-Host "  ok  /$nome"
}
foreach ($nome in $manifesto.skills) { Install-Skill $nome (Join-Path $origem $nome) }

if (-not $manifesto.requerMotor) {
    Write-Host "Instalando o earshot $earshotVersao (efeitos sonoros). Na primeira vez baixa cerca de 1,5 GB e pode levar alguns minutos..."
    New-Item -ItemType Directory -Force -Path (Split-Path $earshotPasta) | Out-Null
    if (Test-Path -LiteralPath (Join-Path $earshotPasta '.git')) {
        Invoke-Passo 'baixar a versao do earshot' { git -C $earshotPasta fetch -q --depth 1 origin "refs/tags/${earshotVersao}:refs/tags/${earshotVersao}" }
        Invoke-Passo 'trocar a versao do earshot' { git -C $earshotPasta -c advice.detachedHead=false checkout -q $earshotVersao }
    } else {
        if (Test-Path -LiteralPath $earshotPasta) { throw "Ja existe $earshotPasta sem Git. Apague essa pasta e rode o instalador de novo." }
        Invoke-Passo 'baixar o earshot' { git -c advice.detachedHead=false clone -q --depth 1 --branch $earshotVersao $earshotRepo $earshotPasta }
    }
    if (-not (Test-Path -LiteralPath $earshotPython)) {
        $resto = @($python | Select-Object -Skip 1) + @('-m', 'venv', (Join-Path $earshotPasta '.venv'))
        Invoke-Passo 'criar o ambiente Python do earshot' { & $python[0] @resto }
    }
    Invoke-Passo 'atualizar o pip do earshot' { & $earshotPython -m pip install -q --disable-pip-version-check --upgrade pip }
    Invoke-Passo 'instalar o PyTorch (CPU)' { & $earshotPython -m pip install -q --disable-pip-version-check torch --index-url https://download.pytorch.org/whl/cpu --extra-index-url https://pypi.org/simple }
    Invoke-Passo 'instalar o earshot' { & $earshotPython -m pip install -q --disable-pip-version-check -e $earshotPasta }
    Invoke-Passo 'testar o banco de sons do earshot' { & $earshotPython -m earshot sfx list --kind hit | Out-Null }
    & $earshotPython -m earshot doctor --fetch | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host 'Aviso: o earshot nao conseguiu baixar os modelos de escuta agora (sem internet ou sem FFmpeg). Eles baixam sozinhos na primeira edicao.' -ForegroundColor Yellow
    }
    Install-Skill 'earshot' (Join-Path $earshotPasta 'skills/earshot')
}

Write-Host "Pronto! $($manifesto.skills.Count) skills instaladas ($($manifesto.id))." -ForegroundColor Green
if ($fezBackup) { Write-Host "As versoes antigas foram guardadas em $backup" }
Write-Host 'Feche e abra o Claude Code. Na pasta do seu video, digite /maquina-de-edicao ou o comando do formato.'
