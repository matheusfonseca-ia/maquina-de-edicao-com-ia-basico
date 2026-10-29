# Cenas-modelo do Reels de Negócio + Pixelado

Cenas HyperFrames tiradas de reels aprovados neste formato (sem nenhuma correção pedida na revisão). Servem de referência de estrutura, convenção e acabamento: **não copie o conteúdo**, copie o jeito de fazer e troque pelo que a fala do vídeo novo diz.

Cada arquivo é uma sub-composição completa (`<template>` + `#root` + timeline GSAP). O id da composição dentro do arquivo (`c01-gancho`, `c08-onze`…) é o do vídeo original: no vídeo novo, use os ids e prefixos das cenas novas. As fontes vêm de `../assets/fonts/` (Inter, JetBrains Mono, Newsreader, Silkscreen, Caveat) e a foto de perfil de `../assets/img/perfil.webp`. Os logos estão desenhados direto no arquivo.

| Arquivo | Layout | O que mostra | Use quando |
|---|---|---|---|
| `gancho-celular.html` | D | Celular com o feed do Instagram; o mascote salta com espada, corte diagonal, tela trinca com glitch, lápide "RIP" com o logo e carimbo "MORTO". Leia primeiro: é o padrão de gancho com muita ação em 2 s. | Gancho |
| `gancho-tv.html` | D | TV entupida de anúncio sofre glitch, vira terminal digitando, a tela racha e o mascote salta pra fora; carimbo "HACKEADA". | Gancho |
| `conectar-logos.html` | D | Dois logos oficiais; um cabo pontilhado sai de um e chega no outro, faísca e ✓ "conectado". | Integração, "conectar X ao Y" |
| `repositorio-carimbo.html` | D | Página de repositório do GitHub reconstruída (linhas em cascata, estrelas, licença) e carimbo verde "GRÁTIS". | Apresentar repositório, ferramenta gratuita |
| `cartao-produto.html` | D | Cartão de produto: mascote sobre um montinho com etiqueta pixel pendurada, pílula mono terracota e o nome digitado. | Nome do produto ou da ideia |
| `carimbo-gratis.html` | D | Chips de provedores com o preço riscado em vermelho à mão e carimbo verde batendo com tremida. | "Grátis", "de graça", "sem pagar" |
| `multiplicacao.html` | F | Uma carta se divide em 11 (grade simétrica) com contador "×1 → ×11", e cada carta ganha um ícone. | Quantidade, "são N", "faz várias" |
| `contador-gigante.html` | F | Pilha de moedas pixel crescendo em cascata em cima e número gigante rolando embaixo. | Número dito na fala |
| `terminal.html` | D | Terminal escuro com comando digitado letra a letra. | Comando, instalação, "o agente roda" |
| `anotacao-a-mao.html` | D | Carta sozinha, palavra manuscrita vermelha "só uma?" e X desenhado à mão. | Negação, correção, "não é só isso" |
| `pixel-cheia-busca.html` | P | Cenário pixel com prateleiras de celulares; o mascote com lupa anda, telas acendem e pegam fogo; HUD com contador dourado. | Clímax de busca, descoberta |
| `pixel-cheia-muro.html` | P | Muro "BLOQUEIO CRIATIVO" que explode quando o mascote investe; ideias subindo; HUD com contador. | Clímax de superar obstáculo |
| `pixel-cheia-hud.html` | P | Montanha de moedas pixel; o mascote tira 90% delas; HUD com porcentagem dourada descendo. | Clímax de resultado, economia, redução |
| `copiar-link.html` | D | Barra de navegador com a URL selecionada e balão "Copiado ✓". | "Copia esse link" |
| `instalar-no-chat.html` | F | A URL encolhe, uma seta desce até o chat, o link é colado, a mensagem digitada e enviada, "✓ Skill instalada" e carimbo "PRONTO". | Como instalar ou usar |
| `cta.html` | D | CTA completo: seguir (botão vira "Seguindo") + comentar (palavra digitada) + "Te envio na DM" + notificação de DM. Troque a foto e o @ pelos da pessoa. | Chamada pra ação |
| `legendas.html` | — | Faixa de legendas: pílula escura fixa em y 764, blocos de 2 a 3 palavras, troca seca. | Sempre |

Layouts: D = dividido (pinta só y 0–770; abaixo fica transparente pra câmera), F = gráfico cheio, P = pixel art cheia. Regras completas em `../com-pixelado.md`.
