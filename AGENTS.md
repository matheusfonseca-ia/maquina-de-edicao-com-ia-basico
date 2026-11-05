# Máquina de Edição com IA Básico

Repositório de instalação do pacote principal. O manifesto `pacote.json` define as skills deste pacote.

Para instalar ou atualizar, rode `powershell -ExecutionPolicy Bypass -File .\instalar.ps1` no Windows ou `bash instalar.sh` no Mac/Linux. Em uma cópia clonada do GitHub, rode `git pull` antes de atualizar. Depois peça para fechar e abrir o Claude Code.

Este pacote inclui o motor e dez formatos (quatro deles são formatos de efeito, que usam o `fx.py` original do claude-video-effects em `.claude/skills/maquina-de-edicao/efeitos/`, só com os rótulos fixos da interface traduzidos pro português; não edite esse arquivo). O link para comprar os dez extras está em destaque no README.

Para editar um vídeo, use uma pasta própria fora deste repositório e chame `/maquina-de-edicao` ou a skill do formato instalado. Preferências pessoais ficam em `~/.maquina-de-edicao/`; só altere as skills quando o usuário pedir uma mudança para todos os alunos.
