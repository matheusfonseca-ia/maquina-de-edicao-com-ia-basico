---
name: cortes-de-video-longo
description: Edita um vídeo falado no formato Cortes de Vídeo Longo. Pega um vídeo longo (YouTube, live, podcast, call, aula), acha e ranqueia os melhores trechos e edita cada um como um corte vertical 9:16 com título de gancho, legenda e gráficos. Depois de escolher o formato, a pessoa escolhe o estilo visual (original do formato, Pixelado, Noite Laranja, Claro Tecnológico ou um que ela criou). Faz parte da Máquina de Edição (precisa da skill maquina-de-edicao instalada). Use quando o usuário chamar /cortes-de-video-longo ou pedir pra editar um vídeo "no formato Cortes de Vídeo Longo", "cortes", "tirar cortes desse vídeo", "clipes do podcast", "cortes da call" ou "transformar vídeo longo em reels".
---

# Cortes de Vídeo Longo

Formato pronto da Máquina de Edição. Pega um vídeo longo (YouTube, live, podcast, call, aula), acha e ranqueia os melhores trechos e edita cada um como um corte vertical 9:16 com título de gancho, legenda e gráficos.

Esta skill não tem um fluxo próprio: ela chama o motor da Máquina de Edição com este formato já escolhido.

1. **Ache o motor.** Ele fica na pasta `maquina-de-edicao`, ao lado da pasta desta skill (as duas estão na mesma pasta de skills). Se não existir, pare e avise: "Esse formato precisa da Máquina de Edição. Rode o instalador do pacote principal da Máquina de Edição (`instalar.ps1` no Windows ou `instalar.sh` no Mac) e abra o Claude Code de novo."
2. **Leia o `SKILL.md` do motor inteiro** e siga o fluxo dele do começo ao fim, com estas regras:
   - O formato já está escolhido: **Cortes de Vídeo Longo** (pasta `cortes-de-video-longo`). Pule a pergunta "Como quer editar este vídeo?" e a lista de formatos. Vá direto pro "Caminho formato pronto", a partir do passo 2.
   - A especificação do formato é o arquivo `formato.md` desta pasta. Leia inteiro antes da fase 1.
   - A pergunta "Qual estilo visual?" (passo 3) continua: é ela que define a aparência do vídeo.
   - Todo o resto é igual ao motor: checar a pasta, a rodada curta de perguntas, a edição autônoma, a revisão no Studio, a exportação só depois da aprovação e as preferências salvas.
3. Se a pessoa pedir pra trocar de formato no meio da conversa, volte pro motor e mostre a lista de formatos.
