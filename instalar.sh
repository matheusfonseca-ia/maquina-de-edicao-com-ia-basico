#!/usr/bin/env bash
# Sem argumento: instala somente o pacote desta pasta.
# No repositorio de desenvolvimento: bash instalar.sh order-bump
set -euo pipefail
raiz="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
case "${1:-principal}" in
  principal) pasta_pacote="$raiz" ;;
  order-bump) pasta_pacote="$raiz/order-bump" ;;
  *) echo 'Use: bash instalar.sh [principal|order-bump]'; exit 1 ;;
esac
# Le os dois campos do manifesto de distribuicao, composto apenas de slugs simples.
# Usa ferramentas do sistema para nao exigir Python ou Node antes da instalacao.
manifesto="$pasta_pacote/pacote.json"
requer_motor="$(sed -n 's/.*"requerMotor":[[:space:]]*\([a-z]*\).*/\1/p' "$manifesto")"
lista="$(sed -n '/"skills"[[:space:]]*:/,/]/p' "$manifesto" | sed 's/.*"skills"[[:space:]]*:[[:space:]]*//; s/].*//' | tr -d '[" \r' | tr ',' '\n' | sed '/^$/d')"
if [ -z "$lista" ] || { [ "$requer_motor" != true ] && [ "$requer_motor" != false ]; }; then
  echo 'Manifesto de pacote invalido.'; exit 1
fi
origem="$pasta_pacote/.claude/skills"
destino="$HOME/.claude/skills"
backup="$HOME/.claude/skills-backup/$(date +%Y-%m-%d_%H-%M-%S)-$$"

# Efeitos sonoros: a Maquina usa sempre o earshot (github.com/Leonxlnx/earshot).
# O pacote principal instala; o complemento so confere que ele existe.
earshot_repo='https://github.com/Leonxlnx/earshot.git'
earshot_versao='v0.4.0'
earshot_pasta="$HOME/.maquina-de-edicao/earshot"
earshot_python="$earshot_pasta/.venv/bin/python"

# Efeitos de video (formatos de efeito): o motor usa o fx.py do claude-video-effects
# (github.com/Vibha-Ramprakash/claude-video-effects), que fica dentro da skill do motor.
# O ambiente Python dele fica fora da skill pra sobreviver as atualizacoes.
efeitos_pasta="$HOME/.maquina-de-edicao/efeitos"
efeitos_python="$efeitos_pasta/.venv/bin/python"

if [ "$requer_motor" = true ] && [ ! -f "$destino/maquina-de-edicao/SKILL.md" ]; then
  echo 'Instale primeiro o pacote principal da Maquina de Edicao. Depois rode este instalador de novo.'
  exit 1
fi
if [ "$requer_motor" = true ] && [ ! -x "$earshot_python" ]; then
  echo 'Falta o earshot (efeitos sonoros). Rode de novo o instalador do pacote principal e depois este.'
  exit 1
fi
if [ "$requer_motor" = true ] && [ ! -x "$efeitos_python" ]; then
  echo 'Falta o motor de efeitos de video. Rode de novo o instalador do pacote principal (versao nova) e depois este.'
  exit 1
fi
python=''
if [ "$requer_motor" = false ]; then
  if ! command -v git >/dev/null 2>&1; then
    echo 'Falta o Git. No Mac: xcode-select --install (ou brew install git). No Linux: sudo apt install git. Depois rode este instalador de novo.'
    exit 1
  fi
  for candidato in python3 python; do
    if command -v "$candidato" >/dev/null 2>&1 &&
       [ "$("$candidato" -c 'import sys; print(int(sys.version_info >= (3, 10)))' 2>/dev/null)" = 1 ]; then
      python="$candidato"; break
    fi
  done
  if [ -z "$python" ]; then
    echo 'Falta o Python 3.10 ou mais novo. No Mac: brew install python. No Linux: sudo apt install python3 python3-venv. Depois rode este instalador de novo.'
    exit 1
  fi
fi
while IFS= read -r nome; do
  case "$nome" in ''|*[!a-z0-9-]*|-*|*-|*--*) echo "Nome de skill invalido: $nome"; exit 1 ;; esac
  if [ ! -f "$origem/$nome/SKILL.md" ]; then echo "Skill ausente no pacote: $nome"; exit 1; fi
done <<< "$lista"
mkdir -p "$destino"
total=0
fez_backup=0
instalar_skill() {
  local alvo="$destino/$1"
  if [ -e "$alvo" ]; then
    mkdir -p "$backup"
    mv "$alvo" "$backup/$1"
    fez_backup=1
  fi
  cp -R "$2" "$alvo"
  echo "  ok  /$1"
}
while IFS= read -r nome; do
  instalar_skill "$nome" "$origem/$nome"
  total=$((total + 1))
done <<< "$lista"

if [ "$requer_motor" = false ]; then
  echo "Instalando o earshot $earshot_versao (efeitos sonoros). Na primeira vez baixa cerca de 1,5 GB e pode levar alguns minutos..."
  mkdir -p "$(dirname "$earshot_pasta")"
  if [ -d "$earshot_pasta/.git" ]; then
    git -C "$earshot_pasta" fetch -q --depth 1 origin "refs/tags/$earshot_versao:refs/tags/$earshot_versao"
    git -C "$earshot_pasta" -c advice.detachedHead=false checkout -q "$earshot_versao"
  else
    if [ -e "$earshot_pasta" ]; then echo "Ja existe $earshot_pasta sem Git. Apague essa pasta e rode o instalador de novo."; exit 1; fi
    git -c advice.detachedHead=false clone -q --depth 1 --branch "$earshot_versao" "$earshot_repo" "$earshot_pasta"
  fi
  if [ ! -x "$earshot_python" ]; then "$python" -m venv "$earshot_pasta/.venv"; fi
  "$earshot_python" -m pip install -q --disable-pip-version-check --upgrade pip
  if [ "$(uname -s)" = Darwin ]; then
    "$earshot_python" -m pip install -q --disable-pip-version-check torch
  else
    "$earshot_python" -m pip install -q --disable-pip-version-check torch --index-url https://download.pytorch.org/whl/cpu --extra-index-url https://pypi.org/simple
  fi
  "$earshot_python" -m pip install -q --disable-pip-version-check -e "$earshot_pasta"
  "$earshot_python" -m earshot sfx list --kind hit >/dev/null
  if ! "$earshot_python" -m earshot doctor --fetch >/dev/null; then
    echo 'Aviso: o earshot nao conseguiu baixar os modelos de escuta agora (sem internet ou sem FFmpeg). Eles baixam sozinhos na primeira edicao.'
  fi
  instalar_skill earshot "$earshot_pasta/skills/earshot"

  echo 'Instalando o motor de efeitos de video (rastreamento do rosto e recorte da pessoa)...'
  mkdir -p "$efeitos_pasta"
  if [ ! -x "$efeitos_python" ]; then "$python" -m venv "$efeitos_pasta/.venv"; fi
  "$efeitos_python" -m pip install -q --disable-pip-version-check --upgrade pip
  "$efeitos_python" -m pip install -q --disable-pip-version-check numpy opencv-python pillow 'mediapipe==1.2.2'
  "$efeitos_python" -c 'import mediapipe, cv2, PIL, numpy'
fi

echo "Pronto! $total skills instaladas."
if [ "$fez_backup" = 1 ]; then echo "As versoes antigas foram guardadas em $backup"; fi
echo 'Feche e abra o Claude Code. Na pasta do seu video, digite /maquina-de-edicao ou o comando do formato.'
