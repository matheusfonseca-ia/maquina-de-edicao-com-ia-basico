# Reels de Negócio + Pixelado

Quando a pessoa escolhe o formato **Reels de Negócio** com o estilo visual **Pixelado**, o vídeo segue **este arquivo**, não os layouts do `formato.md`. É exatamente o estilo do reel do @opusjake (link em "Referência"), o mesmo dos reels do Matheus editados nesse estilo e aprovados sem correção: tela dividida com a câmera embaixo, gráfico em tela cheia e cena em pixel art em tela cheia, alternando a cada frase, e cada frase virando uma cena que mostra literalmente o que está sendo dito.

Prioridade: este arquivo vale por cima do `formato.md` do Reels de Negócio e por cima do `estilos-visuais/pixelado.md`. Onde este arquivo não fala nada, vale o `pixelado.md` (paleta, fontes, repertório de motions, peças) e depois o motor. Ajustes fixos salvos e observações da pessoa continuam valendo por cima de tudo.

Do `formato.md` só continuam: vertical 1080 × 1920, 60 fps, base técnica (contato visual, produtos citados, fontes e verificação), silêncios secos e a saída. **Não usar** do `formato.md`: câmera cheia, gancho com cards atrás da cabeça, título de capa em duas linhas, tela dividida meio a meio, legenda de uma palavra por vez, pílula de notificação no CTA, Kit Noite.

## Referência

O estilo é o do reel https://www.instagram.com/p/DdysDw5t4Km/ ("Arena skill", @opusjake, 34 s). **O vídeo tem que ficar igual a esse reel** em estrutura, ritmo, legenda e acabamento, com o conteúdo da fala da pessoa.

Antes de montar o plano, olhe o reel:

1. Se existir `~/.maquina-de-edicao/estilos/opus-jake/`, abra as imagens de lá (as `folha-*.jpg` mostram 4 quadros por segundo, lidos linha a linha).
2. Se não existir, baixe o reel com `yt-dlp` numa pasta temporária fora do projeto, gere folhas de quadros com FFmpeg (`ffmpeg -i reel.mp4 -vf "fps=4,scale=240:-1,tile=6x4" folha-%02d.jpg`) e olhe todas. Se o download pedir login, siga só por este arquivo. Não use quadros do reel no vídeo nem guarde na pasta do projeto: é só referência.

O que o reel faz, em ordem (é isso que o vídeo novo reproduz, com o assunto da pessoa):

- 0–3 s, dividido: no cartão, um cemitério em pixel art ao pôr do sol (céu em faixas de laranja e roxo, lua, cerca, árvore seca), o personagem à esquerda e lápides "RIP" com frases clichê subindo uma por uma, no ritmo da fala.
- 3–6 s, gráfico cheio: o personagem sozinho acima da legenda; depois ele se multiplica em cascata até 100 (50 acima e 50 abaixo da legenda), com o contador "×1 → ×51 → ×100" embaixo.
- 6–7 s, pixel art cheia: arena (coliseu com arquibancada lotada, chão de areia) com dezenas de personagens armados.
- 7–9 s, dividido: cartão de produto (personagem com escudo e espada sobre um montinho de areia, "/arena" em pílula terracota, nome "Arena" digitado).
- 9–10 s, dividido: print do repositório e carimbo verde "FREE".
- 18–21 s, dividido: três linhas de etapas acendendo ("Draft → Critique → Rewrite"), depois três cartas que viram.
- 21–30 s, pixel art cheia: "RODADA 1 · 50 DUELOS", etiquetas de crítica sobre os personagens, duelo, "RESTAM 100 → 25 → 13 → 7 → 4" em dourado, perdedores cinza com olhos em ×, e "VENCEDOR" com coroa e confete.
- 30–31 s, gráfico cheio: print pequeno em cima, seta terracota descendo, chat escuro embaixo com o link e "instala a skill" sendo digitados.
- 31–34 s, dividido: CTA (seguir + comentar).

## Cenas-modelo

A pasta `cenas-modelo/` (ao lado deste arquivo) tem cenas HyperFrames de vídeos aprovados neste formato. **Abra as do tipo de cada cena antes de construir** e copie a estrutura, as convenções e o acabamento, trocando o conteúdo. O `cenas-modelo/LEIA.md` diz o que cada uma mostra.

## A ideia central

**Cada frase falada vira uma pequena cena que mostra literalmente o que está sendo dito.** "Respostas ruins" vira um cemitério de lápides; "faz 100 versões" vira o mascote se multiplicando até uma grade de 10 × 10 com contador "×100"; "grátis" vira um carimbo verde batendo sobre a página do repositório; "o Claude matou o Instagram" vira o mascote com uma espada cortando o celular, a tela trincando e uma lápide com o logo do Instagram. Não existe cartão genérico com ícone e título.

**Cada efeito acontece na palavra que o nomeia** (o carimbo "GRÁTIS" bate em "gratuito", o contador sobe em "onze", o interruptor liga em "conectar"). Use os tempos das palavras na faixa final.

Antes de construir, escreva em `edit/plano.md` a tabela **"# · início · fim · layout · frase · metáfora visual"** do vídeo inteiro, com os tempos das palavras que disparam cada efeito. Se não achar metáfora pra uma frase, use a peça real (print da página, terminal, chat, repositório) com uma ação em cima (cursor, risco, contorno, carimbo).

## Layouts (1080 × 1920)

**A câmera nunca fica em tela cheia.** Três layouts, trocados sempre por **corte seco**:

### D. Dividido (o principal, ~50–60% do vídeo)

- **Faixa de cima (y 0 a 770):** fundo creme `#EFEDEB` com grade bem fraca (linhas de 2 px a cada 90 px, `#E6E4E1`: `background-image: linear-gradient(#e6e4e1 2px, transparent 2px), linear-gradient(90deg, #e6e4e1 2px, transparent 2px); background-size: 90px 90px; background-position: -1px -1px`).
- **Cartão:** x 90 a 990 (900 px), y 255 a 700 (445 px), raio 28, fundo `#F9F8F6`, sombra `0 18px 40px rgba(0,0,0,.10)`. Pode crescer pra cima até y ≈ 200, **nunca abaixo de y 700**. Selos, chips e cursores podem ficar fora do cartão, na faixa creme, sempre acima de y 700. O conteúdo do cartão muda a cada frase. Variações que o reel usa nessa faixa: um cartão largo com ilustração pixel de borda a borda; três cartões finos empilhados (linhas de etapas); três cartas em leque; cartão de produto; print com carimbo.
- **Câmera (y 770 a 1920):** largura total, **borda reta**, sem moldura, sem cartão arredondado, sem cabeça saindo pra fora. Corte horizontal seco entre o creme e o vídeo. O vídeo é posicionado pra que os olhos fiquem em ~y 1180 (com enquadramento de selfie comum, o topo do vídeo de 1080 × 1920 fica em ~y 500 e só aparece a parte abaixo de 770). Enquadramento fixo: sem zoom, sem punch-in, sem acompanhamento de cabeça.

### F. Gráfico cheio (~25–40%)

- Fundo creme quadriculado na tela inteira, opaco (sem câmera).
- Elemento principal em x 90 a 990. Conteúdo em duas zonas: **acima da legenda (y 200 a 700)** e **abaixo (y 830 a 1500)**. Terminal ou print grande podem descer até y ≈ 1440.

### P. Pixel art cheia (~10–15%, 1 ou 2 por vídeo, no clímax)

- Cena pixel art opaca em 1080 × 1920 (cenário + personagens em sprite andando, se multiplicando, se enfrentando, caindo).
- **O cenário é uma ilustração rica, não blocos lisos**: arquibancada com público, arcos, chão com textura, céu em faixas. Gere com a skill `media-use` ou outro modelo de imagem ("pixel art, 16-bit, <cenário>, sem texto, sem personagens") e amplie com vizinho mais próximo (nunca suavizado). Sem gerador, desenhe o cenário num `<canvas>` pequeno com detalhe (fileiras de público em pontos de cor, arcos, textura de chão) e amplie com `image-rendering: pixelated`.
- O mesmo vale pra ilustração pixel dentro do cartão do dividido (ex: o cemitério do gancho): ela preenche o cartão de borda a borda, com os cantos arredondados do cartão.
- HUD em Silkscreen dentro de caixa preta `#151513` com borda `#3A3836`; número em dourado `#E8B547` (contador descendo ou subindo, "VENCEDOR" com confete).
- Deixe a faixa y 721 a 807 sem nada importante (é da legenda).

### Distribuição

- **Gancho: D**, com a cena mais forte e mais estranha do vídeo, com bastante ação (ex: celular com o feed → mascote salta com espada → corte diagonal → tela trinca com glitch → lápide "RIP" → carimbo "MORTO"). Nunca gancho em câmera cheia, nunca título de capa: o quadro 0 já é o dividido com a cena começando e a primeira legenda.
- **CTA: D**, com o cartão do CTA na faixa de cima (acima da cabeça), do momento em que a pessoa fala "comenta X" até o fim.
- **Clímax** (a virada, o resultado, a briga, a comparação): P.
- O resto alterna D e F. **Dois trechos seguidos nunca usam o mesmo layout.**
- Estrutura típica: gancho (D) → nome do produto ou da ideia (cartão de produto) → como funciona (alterna F e D) → clímax (P) → benefício (antes riscado, depois aparecendo) → como instalar ou usar (print → seta → chat) → CTA (D).

## Ritmo

- Uma cena nova a cada **1,3 a 3 s** de fala (≈ uma por frase ou meia frase). Nenhuma cena passa de 5 s, a não ser o CTA.
- Dentro da cena, algo muda a cada **0,3 a 0,6 s** (elemento entra, contador sobe, risco é desenhado, palavra é digitada). A tela nunca fica parada.
- Cortes de silêncio secos: nenhuma pausa acima de 150 ms na voz (alvo ~110 ms).
- Tomadas repetidas: use a última tomada completa de cada frase.

## Legenda

- **Pílula escura** `#3A3836` a 92%, raio 12, altura 86, folga lateral 34; a largura acompanha o texto (até ~840 px).
- **JetBrains Mono ExtraBold (800), caixa alta**, branco, 52 px, `letter-spacing: 0.08em`.
- **2 a 3 palavras por bloco**, troca seca, sem animação de entrada, sem palavra por palavra, sem cor de destaque.
- **Posição fixa em todos os layouts:** centro em x 540, y 764 (pílula de y 721 a 807), na emenda do dividido (metade sobre o creme, metade sobre a câmera). Nunca muda de lugar.
- Começa no quadro 0. Mantém apóstrofo e interrogação; sem ponto final.

## Peças e movimento

Paleta, fontes e repertório de motions: os do `pixelado.md` (multiplicação com contador, cartão de produto, print real, carimbo, terminal, chat, anotação à mão, cartão de tarefa, personagens cercando, mini cartões, linha de etapas, cartas, etiquetas de crítica em pixel, cronômetro, fluxo de instalação, duelo e vencedor). Além disso:

- **Mascote do Claude Code** quando o assunto é Claude (12 × 8 blocos, terracota `#D97757`, olhos pretos):
  ```
  ..BBBBBBBB..
  ..BBBBBBBB..
  ..BEBBBBEB..
  BBBEBBBBEBBB
  BBBBBBBBBBBB
  ..BBBBBBBB..
  ..B.B..B.B..
  ..B.B..B.B..
  ```
  Acessórios (espada, lupa, café, viseira) em blocos extras. Assunto sem mascote próprio: mascote pixel simples ligado ao tema.
- **Marca citada na fala usa o logo oficial** (Claude, Instagram, GitHub, X…), nunca um personagem ou texto genérico no lugar. Logos em SVG oficial (ex: Simple Icons) dentro de `projeto/assets/img/`.
- **Perfis de terceiros** são genéricos (avatar de cor lisa com inicial, "@perfil_exemplo"). O perfil da pessoa (foto e @) aparece quando a fala diz "sua conta", "seu perfil" e no CTA: peça a foto de perfil se não estiver na pasta.
- **Simetria:** elementos de cada cena alinhados de forma simétrica e harmônica, mesma linha de base, mesmas distâncias do eixo x 540.
- Entradas: `opacity 0 → 1`, subida de 10 px, escala 0,96 → 1, 0,25 s, `power2.out`. Texto digitado letra a letra com cursor de bloco (passos de 0,03 a 0,05 s). Contadores rolando. Grades em cascata (20 a 30 ms). Traços com `stroke-dashoffset` (~0,3 s). Carimbo: escala 1,6 → 1, girado −8 a −12°, tremida curta.
- Sem câmera virtual, sem desfoque de movimento, sem whip pan. **O quadro 0 de cada cena já mostra conteúdo útil** (corte seco), nunca o cartão vazio.
- Valores ilustrativos (curtidas, notas, contadores que não estão na fala) são permitidos se forem claramente ilustrativos e registrados no relatório; números ditos na fala aparecem como foram ditos.

## CTA

Dividido. Cartão na faixa de cima com duas linhas numeradas por círculos terracota:

1. Foto de perfil da pessoa com anel de story + "Seguir" (Inter 700) + @perfil, e botão azul "Seguir" que vira "Seguindo" cinza.
2. "Comente" + campo onde a palavra-chave é digitada em caixa alta, com contorno terracota.

Embaixo, pequeno: "✈ Te envio na DM". Na palavra "DM" (ou "direct"), uma notificação de DM chega acima do cartão. Fica até o fim. Modelo: `cenas-modelo/cta.html`.

## Montagem (HyperFrames)

- `index.html` 1080 × 1920, 60 fps. Faixa 0: câmera cortada contínua, visível só na janela y 770 a 1920 (as cenas D pintam só y 0 a 770 e deixam o resto transparente; F e P cobrem a tela). Faixa 2: uma sub-composição por cena (`compositions/c01-<nome>.html`…). Faixa 4: legendas (`compositions/legendas.html`). Depois as faixas de áudio.
- Contrato de cada cena (o que faz as cenas-modelo funcionarem):
  - `<template>` com `<style>`, `#root` e `<script>` dentro; `#root` com `data-composition-id`, `data-width="1080"`, `data-height="1920"`, `data-duration` = duração da cena. Tempo local = tempo global − início da cena.
  - Um único `gsap.timeline({ paused: true })` registrado em `window.__timelines["<id>"]`, terminando com `tl.set({}, {}, <duração>)`.
  - **Prefixe todas as classes, ids e nomes de fonte com o id da cena** (`c07-…`, `"C07 Inter"`): os estilos de todas as cenas se juntam numa página só.
  - Fontes locais por `@font-face` (`../assets/fonts/`): JetBrains Mono, Inter, Newsreader, Silkscreen, Caveat.
  - Estados iniciais com `gsap.set(...)` antes da timeline (um `tl.set` na posição 0 não aparece no quadro 0). Cuidado com `tl.fromTo`: o "from" é aplicado no quadro 0 da cena; use só se o "from" for invisível, ou `immediateRender: false`.
  - Proibido: `Math.random` (use gerador com semente fixa), relógio, rede, `repeat: -1`. Pixel art de cenário num `<canvas>` pequeno com `image-rendering: pixelated`; personagens animados como grade de `div`s de 12 px ou mais.
  - Nenhum texto gráfico menor que 30 px (rótulo mono secundário: 26 px no mínimo). Contraste mínimo 3:1.
- Vídeo com muitas cenas: dá pra dividir a construção entre ajudantes em paralelo (4 a 6 cenas cada), todos com o mesmo guia (`edit/work/brief-cenas.md` com o contrato acima, a geometria, as peças comuns do vídeo e os tempos das palavras) e as cenas-modelo.

## Áudio

- Clima da música e timbre dos efeitos: os do `pixelado.md`. Quantidade e volume: o padrão universal do motor (poucos efeitos, só nos eventos fortes, no máximo 1 a cada 0,6 s, bem abaixo da voz).
- Riser curto terminando exatamente no fim do gancho.
- Cada cena lista seus eventos de som (tempo global + tipo: pop, carimbo, clique, confirmação, moeda, 8 bits…) e o motor mixa tudo num `sfx.wav`.

## Verificação (além da do motor)

- Câmera só embaixo, com borda reta em y 770; nunca em tela cheia.
- Nenhum par de cenas seguidas com o mesmo layout; os três layouts aparecem (P pelo menos uma vez, no máximo duas).
- Nas cenas D, nada abaixo de y 700 além da câmera.
- Legenda fixa em y 764 em todos os quadros, sem cobrir nada importante; quadro 0 com cena + legenda.
- Cada efeito na palavra que o nomeia (confira 3 ou 4 nos quadros).
- Cortes de cena conferidos nos dois lados em quadros reais: a cena nova aparece desde o primeiro quadro previsto.
- Compare snapshots com as cenas-modelo: mesmo acabamento (hierarquia, alinhamento simétrico, nada cortado, texto legível).
- Monte uma folha de quadros do vídeo (4 por segundo) e ponha do lado das folhas do reel de referência: mesmas telas, mesma legenda, mesmo ritmo de troca e o mesmo nível de ação dentro de cada cena. Onde estiver mais parado ou mais genérico que o reel, refaça a cena.
