# Telas em Profundidade

Resumo: você em tela cheia e, atrás da sua cabeça, interfaces e telas reais (perfil, painel de métricas, fluxo, calendário) que se montam e reagem ao que você fala; embaixo, uma notificação em pílula.

O visual descrito aqui (cores, fontes, materiais, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, o layout, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md`.

## Como fica

A pessoa ocupa a tela toda, mas o fundo real dela fica escurecido e, entre o fundo e a pessoa, aparece uma tela de produto grande: o perfil do Instagram crescendo, um painel com gráfico subindo, um fluxo com passos ganhando check verde, um calendário se preenchendo. A cabeça fica **na frente** da tela, o que dá a sensação de profundidade. Na altura do peito, uma pílula de notificação mostra o resultado daquele momento ("+154% de visualizações").

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Completo, sem câmera virtual de passagem), visual original da legenda e dos gráficos (trocado se a pessoa escolher outro estilo visual), capa, verificação de fontes (ligada).

## Base técnica

- Remoção de fundo no vídeo inteiro (a pessoa recortada fica na frente das telas).
- Vale: produtos citados (com prioridade pra interface real), representação das ações (digitar, clicar, check), fontes e verificação.
- Não vale: layouts B e C do motor, câmera virtual de passagem, desfoque de movimento, contato visual obrigatório.
- Render a 60 fps direto.

## Entradas extras

Nenhuma. Se a fala citar um produto, capture a interface real (`npx hyperframes capture`) ou reconstrua fielmente a partir de capturas públicas e registre no relatório.

## Ritmo e corte

- Regras de limpeza do motor.
- A tela de trás muda a cada ideia (4 a 8 s), com transição própria (ver Gráficos). Dentro da mesma ideia, a tela evolui (números sobem, itens marcam).

## Layouts

Um layout só. Camadas, de trás pra frente:

1. **Gravação original**, em 1080 × 1920, escurecida (brilho 0,45) e desfocada (12 px).
2. **Tela de interface** (o "painel"): 1000 × 640 px, x = 40, topo entre y = 300 e y = 420 (ajuste pra que o topo do painel fique ~80 px abaixo do topo da cabeça). Raio 22 px, fundo `#141416`, borda 1 px `rgba(255,255,255,0.08)`, sombra `0 40px 90px rgba(0,0,0,0.6)`.
3. **A pessoa recortada**, por cima do painel, com sombra suave nas bordas (`drop-shadow(0 0 40px rgba(0,0,0,0.5))`).
4. **Pílula de resultado**: x = 140, y = 1350, 800 × 104 px.
5. **Legenda**.

O painel pode passar atrás da cabeça e dos ombros. As informações importantes do painel ficam nas laterais (x < 300 ou x > 780), onde a cabeça não cobre. Planeje o conteúdo de cada painel sabendo onde a cabeça está (meça num quadro de referência).

## Direção visual

- Fontes: Inter (400, 500, 600, 700) e Instrument Serif itálico, locais.
- Painéis em modo escuro: fundo `#141416`, cards internos `#1C1C1F`, texto `#F4F4F5`, secundário `#8E8E93`.
- Laranja `#E8873A` pra itens em andamento. Verde `#34C759` pra concluídos. Vermelho `#FF453A` pra erro ou zero.
- Pílula de resultado: `rgba(28,28,31,0.92)` com borda 1 px `rgba(255,255,255,0.1)`, raio 26 px, ícone à esquerda num quadrado arredondado de 56 px, título Inter 600 30 px, subtítulo Inter 400 22 px `#8E8E93`, valor à direita em Inter 700 44 px (verde quando é ganho, laranja quando é ação).

## Gráficos

Tipos de painel, escolhidos pelo que a fala descreve:

- **Perfil de rede social**: cabeçalho com avatar, @, posts e seguidores (números contando), e grade de posts 3 colunas com rótulos "DIA 1", "DIA 2"... que vão aparecendo.
- **Painel de métricas**: abas no topo ("Visão geral", "Conteúdo", "Público"), número grande à esquerda (ex: "1,2 mi"), gráfico de linha verde subindo, variação em verde.
- **Fluxo ou sistema**: abas ("Seu sistema", "Fluxo", "Ajustes"), coluna de passos à esquerda (caixas com borda tracejada vermelha quando faltam, borda laranja quando ativas) e coluna de círculos à direita que viram check verde quando o passo é citado como feito.
- **Calendário**: "Próximos 30 dias" no topo, grade 6 × 5 de dias. Os dias se preenchem em laranja com check, e no fim viram todos verdes.
- **Interface de produto citado**: a tela real do produto, com a ação descrita (digitar, clicar, gerar).

Transições:

- Entre painéis: o painel atual desfoca (0 → 18 px) e some em 0,3 s enquanto o novo entra com subida de 40 px e fade em 0,4 s (power3.out).
- Quando a fala marca erro ou "não funciona": um selo vermelho de 56 px com "×" aparece no canto superior direito do painel, com o painel tremendo 6 px por 0,2 s.
- Pílula de resultado: entra com subida de 24 px e fade em 0,35 s quando o resultado é falado. Troca quando o resultado muda. Pode ficar vazia (sem pílula) em trechos sem resultado.

## Legendas

- Inter 600, 56 px, branca, sombra `0 4px 18px rgba(0,0,0,0.7)`.
- De 2 a 4 palavras por bloco.
- Centralizada em x, centro em y = 1230 (peito), entre o painel e a pílula.
- Destaque a cada 2–3 blocos: palavra em Instrument Serif itálico, 1,4× o tamanho, laranja `#E8873A`, com brilho `0 0 30px rgba(232,135,58,0.45)`.

## Capa e gancho

No quadro 0: o primeiro painel do vídeo já montado (com os números finais daquele painel), a pessoa na frente e a primeira legenda. Sem título extra. Do quadro 1 em diante, o painel se monta com a animação normal.

## Chamada para ação

Se houver "comenta X": a pílula de resultado vira uma mensagem ("@novocliente: X"), com um ponto verde de "online", e o último painel mostra a palavra X sendo digitada num campo de comentário.

## Áudio

- Música: eletrônica tecnológica, 112–122 BPM, sintetizador pulsante e bumbo firme, sem melodia principal. ~−24 LUFS.
- Efeitos: "tic" de interface em cada item que aparece, teclas na digitação, sinal de duas notas em cada check verde, "erro" grave curto no selo vermelho, whoosh suave na troca de painel (no máximo 4 no vídeo). Riser terminando no fim do gancho.

## Saída

`edit/final.mp4`, 1080 × 1920, 60 fps, H.264 + AAC 48 kHz.

## Verificação do formato

- A cabeça fica na frente do painel em todos os quadros, sem borda de recorte visível.
- Informação importante do painel nunca escondida atrás da cabeça.
- Números dos painéis batem com a fala (nada inventado; exemplos ilustrativos marcados no relatório).
- Pílula de resultado e legenda sem se sobrepor.
- Interfaces reconstruídas listadas no relatório.
