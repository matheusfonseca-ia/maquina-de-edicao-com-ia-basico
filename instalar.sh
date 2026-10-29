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
if [ "$requer_motor" = true ] && [ ! -f "$destino/maquina-de-edicao/SKILL.md" ]; then
  echo 'Instale primeiro o pacote principal da Maquina de Edicao. Depois rode este instalador de novo.'
  exit 1
fi
while IFS= read -r nome; do
  case "$nome" in ''|*[!a-z0-9-]*|-*|*-|*--*) echo "Nome de skill invalido: $nome"; exit 1 ;; esac
  if [ ! -f "$origem/$nome/SKILL.md" ]; then echo "Skill ausente no pacote: $nome"; exit 1; fi
done <<< "$lista"
mkdir -p "$destino"
total=0
fez_backup=0
while IFS= read -r nome; do
  alvo="$destino/$nome"
  if [ -e "$alvo" ]; then
    mkdir -p "$backup"
    mv "$alvo" "$backup/$nome"
    fez_backup=1
  fi
  cp -R "$origem/$nome" "$alvo"
  echo "  ok  /$nome"
  total=$((total + 1))
done <<< "$lista"
echo "Pronto! $total skills instaladas."
if [ "$fez_backup" = 1 ]; then echo "As versoes antigas foram guardadas em $backup"; fi
echo 'Feche e abra o Claude Code. Na pasta do seu video, digite /maquina-de-edicao ou o comando do formato.'
