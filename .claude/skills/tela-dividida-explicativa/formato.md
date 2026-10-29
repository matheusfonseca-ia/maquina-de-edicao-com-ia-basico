# Tela Dividida Explicativa

Resumo: você num cartão na parte de baixo com a cabeça saindo pra fora dele, e a explicação animada em cima: cards de vidro, contadores, gráficos que se desenham e títulos com uma palavra em serifa laranja.

O visual descrito aqui (cores, fontes, materiais, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, o layout, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md`.

## Como fica

A tela é preta, com uma grade de pontos quase invisível e brilho laranja difuso. Embaixo fica um cartão arredondado com a gravação da pessoa, e a cabeça passa por cima da borda do cartão. Em cima, cada ideia vira uma animação: título curto no topo, cards de vidro que acendem em laranja quando são citados, números que contam, gráficos que se desenham, barra de progresso dos passos. De vez em quando o vídeo corta pra pessoa em tela cheia, pra dar respiro.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Com imagens + animações do Kit Noite, sem câmera virtual), visual original da legenda e dos gráficos (trocado se a pessoa escolher outro estilo visual), capa (o primeiro título já é a capa), verificação de fontes (ligada).

## Base técnica

- Vale: contato visual (bloco 3), remoção de fundo pra cabeça sair do cartão (mesma técnica do layout B do motor), produtos citados, fontes e verificação.
- Não vale: câmera virtual, profundidade de campo, desfoque de movimento.
- Render a 60 fps direto.

## Entradas extras

Nenhuma.

## Ritmo e corte

- Regras de limpeza do motor, sem mudanças.
- 75% a 85% do vídeo no layout dividido. O resto em câmera cheia.
- A tela de cima muda de "cena" a cada ideia (normalmente 3 a 6 s por cena), mas a mudança é animada dentro do mesmo layout: o cartão de baixo não pisca nem corta entre cenas.

## Layouts

### A. Dividido (principal)

- Fundo: Kit Noite com textura de pontos.
- **Cartão da câmera**: x = 69, y = 1406, largura 942 px, altura 600 px (passa da borda de baixo), raio 28 px, borda 1,5 px `rgba(255,255,255,0.12)`. Dentro, a gravação recortada com o rosto centralizado.
- **Cabeça pra fora**: versão recortada (fundo removido) do mesmo quadro, alinhada ao cartão, mostrando cabeça e pescoço acima da borda de cima do cartão. O topo da cabeça fica ~70 px acima da borda (y ≈ 1336). Suavize a máscara alfa em ~30 px na borda. Mesmo quadro de origem no cartão e na máscara em todo instante.
- **Área da explicação**: de y = 120 a y = 1000.
- **Legenda**: centrada em y = 1218, entre a explicação e o cartão.

### B. Câmera cheia

Gravação em 1080 × 1920 por recorte proporcional, sem zoom. A legenda vai pro peito (y = 1180).

### Regras de distribuição

- Gancho: dividido, com o título do vídeo em cima.
- Opinião forte, frase dirigida ao espectador ou frase de impacto: câmera cheia (com contato visual), de 1,5 a 3 s.
- Todo o resto: dividido.
- Encerramento: câmera cheia.

## Direção visual

Kit Noite inteiro (`maquina-de-edicao/referencias/kit-noite.md`), com textura de pontos. Uma mancha de brilho laranja atrás do card ativo, que acompanha o card quando o ativo muda (0,5 s, power2.inOut).

## Gráficos

Cada cena da área de explicação tem:

1. **Título no topo** (y = 310 a 420): o "título com palavra em destaque" do Kit Noite, resumindo a ideia em até 5 palavras ("Faz em *três* passos"). O título fica até a ideia mudar.
2. **Um elemento principal** entre y = 470 e y = 960, escolhido pelo que a fala descreve:
   - **Passos ou lista**: cards de vidro de 300 × 357 px lado a lado (até 3), com 36 px de espaço, ligados por uma linha de 2 px. Cada card tem título (Inter 700 42 px), índice "01" no canto e um mini visual (thumb de vídeo com play, linhas de texto, botão). O card aparece quando é citado e vira o card ativo. Embaixo dos cards, barra de progresso (x = 68 a 1012, y = 957) que avança a cada passo.
   - **Número ou comparação**: 1 ou 2 cards de contador (330 × 170 px) com rótulo pequeno em cima ("Posts no mês") e número grande (Inter 700 120 px). Números negativos ou ruins em branco, resultado bom em laranja.
   - **Crescimento ou tendência**: card de 660 × 300 px com gráfico de linha que se desenha, mais um card de contador embaixo ("Dia 1" → "Dia 30", "+12").
   - **Notificações ou provas**: pílulas de notificação empilhadas.
   - **Relação entre coisas** (A leva a B): dois cards pequenos com uma linha curva laranja ligando os dois e uma etiqueta laranja no meio ("O sistema").
   - **Produto citado**: logo oficial num card de vidro quadrado de 300 px, depois a interface real.
3. Elementos entram em sincronia com a palavra que os nomeia. Nada aparece antes de ser falado.

## Legendas

Legenda padrão do Kit Noite, com estas mudanças:

- 56 px, de 1 a 3 palavras por bloco.
- Destaque em Instrument Serif itálico laranja a cada 2–3 blocos, sempre na palavra que também está no título ou no card ativo.
- Centrada em x, y = 1218 no dividido, y = 1180 na câmera cheia.

## Capa e gancho

O quadro 0 mostra o layout dividido já com o título do gancho completo no topo (sem animação no quadro 0) e a pessoa no cartão. Título em até 6 palavras, com uma palavra em serifa laranja ("Posta todo dia, / *zero* clientes"). A partir do quadro 1, o título se "monta" de novo com a animação normal.

## Chamada para ação

Se houver "comenta X": na área de explicação, um card de vidro de 860 × 200 px com avatar genérico, a palavra X sendo digitada com cursor piscante e um botão laranja "Publicar" que é clicado no fim (com "tic" e sinal de confirmação). Sem chamada na fala, não crie.

## Áudio

- Música: eletrônica minimalista e escura, 100–110 BPM, pads quentes e bumbo suave. ~−24 LUFS.
- Efeitos: os do Kit Noite. "Tic" em cada card que entra, "pop" em contador, sinal de confirmação quando um passo é concluído, nenhum whoosh (não tem troca de tela cheia). Riser terminando no fim do gancho.

## Saída

`edit/final.mp4`, 1080 × 1920, 60 fps, H.264 + AAC 48 kHz.

## Verificação do formato

- A cabeça sai do cartão desde o primeiro quadro de cada trecho dividido e não se separa do corpo em movimentos rápidos.
- Só um card ativo por vez.
- Nenhum elemento da explicação abaixo de y = 1000 ou cobrindo a legenda.
- Cada elemento aparece no máximo 2 quadros antes da palavra que o nomeia.
- O cartão da câmera não pisca nem corta entre cenas do mesmo trecho.
