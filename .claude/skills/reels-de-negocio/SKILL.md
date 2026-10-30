---
name: reels-de-negocio
description: Edita um vídeo falado no formato Reels de Negócio. Vídeo vertical 9:16 de ritmo alto que alterna câmera cheia, tela dividida (prova em cima, pessoa embaixo) e animação em tela cheia a cada corte, com legenda de uma palavra por vez. Depois de escolher o formato, a pessoa escolhe o estilo visual (original do formato, Pixelado, Noite Laranja, Claro Tecnológico ou um que ela criou). Faz parte da Máquina de Edição (precisa da skill maquina-de-edicao instalada). Use quando o usuário chamar /reels-de-negocio ou pedir pra editar um vídeo "no formato Reels de Negócio", "reels de negócio", "reels pra vender" ou "reels de negócio com animação".
---

# Reels de Negócio

Formato pronto da Máquina de Edição. Vídeo vertical 9:16 de ritmo alto que alterna câmera cheia, tela dividida (prova em cima, pessoa embaixo) e animação em tela cheia a cada corte, com legenda de uma palavra por vez.

Esta skill não tem um fluxo próprio: ela chama o motor da Máquina de Edição com este formato já escolhido.

1. **Ache o motor.** Ele fica na pasta `maquina-de-edicao`, ao lado da pasta desta skill (as duas estão na mesma pasta de skills). Se não existir, pare e avise: "Esse formato precisa da Máquina de Edição. Rode o instalador do pacote principal da Máquina de Edição (`instalar.ps1` no Windows ou `instalar.sh` no Mac) e abra o Claude Code de novo."
2. **Leia o `SKILL.md` do motor inteiro** e siga o fluxo dele do começo ao fim, com estas regras:
   - O formato já está escolhido: **Reels de Negócio** (pasta `reels-de-negocio`). Pule a pergunta "Como quer editar este vídeo?" e a lista de formatos. Vá direto pro "Caminho formato pronto", a partir do passo 2.
   - A especificação do formato é o arquivo `formato.md` desta pasta. Leia inteiro antes da fase 1.
   - Se o estilo escolhido for **Pixelado**, leia também `com-pixelado.md` inteiro: ele manda por cima do `formato.md` (é o formato dos reels editados no estilo Opus Jake) e aponta as `cenas-modelo/`.
   - A pergunta "Qual estilo visual?" (passo 3) continua: é ela que define a aparência do vídeo.
   - **Centralização obrigatória em todos os vídeos:** mantenha o centro da cabeça exatamente no centro horizontal da área visível reservada à pessoa (tela inteira ou janela da câmera), sem desvio para a esquerda ou direita. Reenquadre cada tomada e acompanhe movimentos. Esta regra prevalece sobre posições do `formato.md`, estilos e preferências; confira antes do Studio e no MP4 final. Siga o bloco 2A das instruções base do motor.
   - Todo o resto é igual ao motor: checar a pasta, a rodada curta de perguntas, a edição autônoma, a revisão no Studio, a exportação só depois da aprovação e as preferências salvas.
3. Se a pessoa pedir pra trocar de formato no meio da conversa, volte pro motor e mostre a lista de formatos.
