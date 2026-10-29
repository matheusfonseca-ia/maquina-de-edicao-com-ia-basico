# Reels de Negócio

Resumo: alterna câmera cheia, tela dividida e animação em tela cheia a cada corte, num visual escuro com brilho laranja, cards de vidro e legenda de uma palavra por vez.

O visual descrito aqui (cores, fontes, materiais, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, o layout, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md`.

**Com o estilo Pixelado, este arquivo não manda nos layouts:** siga `com-pixelado.md` (nesta pasta), o formato dos reels editados no estilo Opus Jake: dividido com a câmera embaixo, gráfico cheio e pixel art cheia, sem câmera cheia, sem título de capa, legenda em pílula fixa na emenda, e as `cenas-modelo/` como referência.

## Como fica

Vídeo vertical de ritmo alto, pra quem vende serviço ou ensina negócio. A cada corte o layout muda: ora a pessoa ocupa a tela toda, ora a tela se divide (prova visual em cima, pessoa embaixo), ora a tela inteira vira animação (passos, documentos, números). No gancho, a pessoa fica na frente de uma fileira de cards (reels, posts) que passam atrás da cabeça. A legenda mostra uma palavra por vez, grande, no meio da tela.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Completo, sem câmera virtual de passagem), visual original da legenda e dos gráficos (trocado se a pessoa escolher outro estilo visual), capa (título de gancho em duas linhas), verificação de fontes (ligada só se a fala citar notícia ou número de terceiros).

## Base técnica

- Vale: contato visual (bloco 3), produtos citados, fontes e verificação, remoção de fundo (pra cabeça na frente dos cards no gancho).
- Não vale: câmera virtual com passagens rápidas, profundidade de campo e desfoque de movimento do bloco 5. Os elementos animam sozinhos e a "câmera" das telas gráficas fica parada.
- Render a 60 fps direto.

## Entradas extras

Nenhuma. Imagens e interfaces seguem a ordem de origem de `formatos-prontos.md`.

## Ritmo e corte

- Trechos de 1,5 a 4 s. Nenhum trecho passa de 5 s.
- O layout troca a cada corte. Dois trechos seguidos nunca usam o mesmo layout.
- Proporção aproximada no vídeo: 40% câmera cheia, 30% tela dividida, 30% animação em tela cheia.
- Silêncios mais secos que o padrão: reduza pausas acima de 200 ms pra cerca de 90 ms.

## Layouts

### A. Câmera cheia

Gravação ocupando 1080 × 1920 por recorte proporcional, cabeça com o topo entre y = 380 e y = 520. Sem zoom.

### A-gancho. Câmera cheia com cards atrás

Só no gancho (primeiros 2–4 s). Fundo: a própria gravação com a pessoa recortada (remoção de fundo). Entre o fundo e a pessoa, uma fileira horizontal de 5 a 7 cards verticais (proporção 9:16, 230 × 410 px, raio 18 px, vidro do Kit Noite) centrada em y = 820, que desliza devagar da direita pra esquerda (60 px por segundo). A cabeça e os ombros da pessoa ficam na frente dos cards. Os cards mostram o que a fala cita (reels, posts, telas). Se nada for citado, mostram capas genéricas de vídeo (retângulo cinza com ícone de play).

### B. Tela dividida horizontal

- Metade de cima (y = 0 a 960): tela gráfica no Kit Noite (fundo preto + brilho laranja).
- Metade de baixo (y = 960 a 1920): a gravação, recortada pra preencher 1080 × 960, com o rosto centralizado e o topo da cabeça ~90 px abaixo da divisa.
- Divisa reta, sem borda, sem sombra.
- Conteúdo da metade de cima: no máximo 3 pílulas de notificação, um card de vidro ou um número grande, centralizado entre y = 120 e y = 820.

### C. Animação em tela cheia

Tela inteira no Kit Noite. Um assunto por tela: lista de passos em pílulas de vidro empilhadas, documento (janela clara estilo Google Docs, 860 × 560 px, raio 18 px, rolando pra mostrar a parte citada com marca-texto amarelo `#FDE68A` na frase), contador, gráfico de linha ou grade de dias.

### Regras de distribuição

- O gancho usa A-gancho.
- Frase com número, resultado ou prova (prints, notificações, métricas) → B.
- Lista, passos, processo, plano → C, com os itens aparecendo conforme são falados e o item atual como card ativo.
- Opinião, frase de impacto e frase dirigida ao espectador → A, se houver contato visual.
- O encerramento (a partir da chamada pra ação) usa A.

## Direção visual

Kit Noite inteiro (`maquina-de-edicao/referencias/kit-noite.md`). Sem textura de pontos. Brilho laranja em duas manchas: uma no canto superior esquerdo e outra no inferior direito, que trocam de lugar suavemente a cada tela C.

## Gráficos

- Pílulas de passo (tela C): 520 × 96 px, raio 999 px, ícone de 36 px à esquerda, texto Inter 600 40 px, índice "01" à direita em `#A1A1AA`. Empilhadas com 28 px de espaço, centralizadas em x. A pílula do passo falado agora fica ativa (borda e brilho laranja); as anteriores ficam com opacidade 0,7.
- Notificações (tela B): pílula de notificação do Kit Noite. Número que importa (ex: "0 clientes") em vermelho `#FF453A` dentro do texto.
- Documento (tela C): título em Inter 700 44 px com a primeira palavra marcada em amarelo, cabeçalhos em Inter 600 32 px e linhas cinza no lugar do texto corrido que não é citado.
- Logo de produto citado: card de vidro quadrado de 360 px com o logo oficial centralizado, entrando com "pop" (escala 0,85 → 1 em 0,35 s, back.out(1.6)).

## Legendas

- **Uma palavra por vez.** Cada palavra aparece no instante em que é dita e some quando a próxima entra.
- Inter 800, 96 px, branca, sombra `0 6px 24px rgba(0,0,0,0.6)`, centralizada em x.
- Posição: y = 1174 (centro do texto) na câmera cheia, na altura do pescoço/peito. Na tela dividida, a legenda vai pra y = 900 (logo acima da divisa), em Inter 700 56 px e com a frase inteira de até 4 palavras. Na tela C, y = 1130, frase de até 4 palavras, Inter 700 56 px.
- Palavras de destaque (número, resultado, nome de produto) em `#CC7430`, sem trocar a fonte.
- Nada de legenda no quadro 0.

## Capa e gancho

Título do gancho em duas linhas, visível do quadro 0 até o fim da primeira frase:

- Linha 1: Inter 800, 82 px, branca, sombra suave, centralizada em y = 311.
- Linha 2: Inter 800, 82 px, texto preto `#0A0A0A` sobre caixa branca justa (padding 10 × 18 px, raio 4 px), centralizada em y = 416.
- Texto curto: a dor ou a promessa do vídeo em até 8 palavras, terminando em pergunta quando fizer sentido ("Posta todo dia / mas não vende nada?").

## Chamada para ação

Se houver "comenta X": pílula de notificação do Kit Noite em y = 1500, mostrando "@seuperfil comentou: X", que entra com o "tic" de vidro. Se a chamada for outra (link, seguir), mostre uma pílula com o texto curto da ação. Sem chamada na fala, não crie.

## Áudio

- Música: eletrônica escura e moderna, 110–118 BPM, bumbo seco e sintetizador grave (sub-bass) com acordes abafados. Sem melodia principal. ~−24 LUFS.
- Efeitos: os do Kit Noite. Um "tic" por pílula ou card que entra, "pop" em número grande, whoosh nas trocas pra tela C (no máximo 3 no vídeo). Riser de 2 s terminando no fim do gancho.

## Saída

`edit/final.mp4`, 1080 × 1920, 60 fps, H.264 + AAC 48 kHz.

## Verificação do formato

- Nenhum par de trechos seguidos com o mesmo layout.
- Nenhum trecho acima de 5 s.
- Os três layouts aparecem no vídeo.
- Legenda de uma palavra sincronizada: cada palavra aparece no máximo 1 quadro antes de ser dita.
- No gancho, a cabeça fica na frente dos cards desde o primeiro quadro, sem borda de recorte visível.
- Caixa branca da linha 2 do título justa ao texto, sem cortar letras.
