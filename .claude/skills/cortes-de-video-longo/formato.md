# Cortes de Vídeo Longo

Resumo: entra um vídeo longo (YouTube, live, podcast, call, aula) e saem vários cortes verticais, ranqueados do melhor pro pior, cada um editado com título de gancho, legenda e gráficos escuros com brilho laranja.

O visual descrito aqui (cores, fontes, materiais, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, o layout, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md`.

## Como fica

Cada corte é um reel completo e independente: começa com um título forte de duas linhas no topo, a pessoa em tela cheia (reenquadrada pro vertical), legenda com palavra em serifa laranja e, nos momentos de número, lista ou passo, a tela se divide (gráfico em cima, pessoa embaixo) ou vira animação em tela cheia. A ordem dos arquivos já é o ranking: o corte 01 é o que tem mais chance de performar.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Com imagens, sem câmera virtual), visual original da legenda e dos gráficos (trocado se a pessoa escolher outro estilo visual), capa (título de duas linhas), verificação de fontes (ligada só pra notícia ou número de terceiros).

## Base técnica

- Vale por corte: blocos 1, 2 (limpeza dentro do corte), 3 (contato visual), produtos citados, fontes.
- Não vale: câmera virtual, profundidade de campo, desfoque de movimento.
- Render a 60 fps direto.

## Entradas extras

- O vídeo longo na pasta, gravado na horizontal (é o formato oferecido pra gravação horizontal; numa gravação vertical, os formatos verticais servem melhor). Qualquer duração. Pode ter mais de uma pessoa (podcast, call).
- Se a fase 0 detectar vídeo com menos de 3 minutos, avise: "Esse vídeo é curto pra virar cortes. Quer editar ele inteiro? (O YouTube Educativo é o mais parecido.)". Se a pessoa insistir, siga com 1 ou 2 cortes.

## Fluxo diferente

Este formato muda as fases 1 a 4 do motor assim:

### Fase 1 (perguntas extras)

Junto com a rodada curta do caminho formato pronto, pergunte:

- **Quantos cortes?** "Os 5 melhores (Recomendado)", "Os 3 melhores", "Os 10 melhores".
- **Duração de cada corte?** "Entre 30 e 60 s (Recomendado)", "Até 30 s", "Entre 60 e 90 s".

### Fase 2a: achar e ranquear os cortes (antes de editar)

1. Transcreva o vídeo inteiro com tempos por palavra (bloco 1). Se houver mais de uma pessoa, separe quem fala (diarização) quando a ferramenta permitir; senão, separe por pausas e mudança de voz e registre como palpite.
2. Liste candidatos: trechos que fazem sentido sozinhos, com começo forte e fim fechado, dentro da duração escolhida (pode juntar frases não contínuas do mesmo assunto, desde que o sentido não mude).
3. Dê nota de 0 a 10 a cada candidato em 5 critérios e some:
   - **Gancho**: a primeira frase prende sozinha (pergunta, número, contradição, promessa)?
   - **Independência**: dá pra entender sem ter visto o resto?
   - **Valor**: ensina, revela ou muda a opinião de quem assiste?
   - **Emoção**: tem energia, humor, história ou tensão?
   - **Final**: termina numa conclusão clara, não no meio de uma ideia?
4. Ranqueie e pegue os N melhores, sem sobreposição entre eles.
5. **Mostre o ranking pra pessoa antes de editar** (esta é a única pausa da fase 2): tabela com posição, título sugerido, tempo no vídeo original, duração, nota e uma linha do porquê. Pergunte: "Posso editar esses cortes?" e aceite trocas ("tira o 3, coloca aquele sobre preço").
6. Salve o ranking aprovado em `edit/ranking.md`.

### Fase 2b: editar cada corte

- Cada corte é um subprojeto em `edit/cortes/NN-titulo-curto/` (NN = posição no ranking, 01, 02...). Cada um tem o próprio `plano.md` e a própria composição HyperFrames.
- Se o ambiente tiver subagentes, edite os cortes em paralelo, com a mesma direção visual.
- Reenquadramento:
  - Uma pessoa na gravação horizontal: recorte 9:16 que segue o rosto (detecção de rosto a cada ~0,5 s, movimento do recorte suavizado, sem trancos; parado quando a pessoa está parada).
  - Duas ou mais pessoas: o recorte vai pra quem está falando, com corte seco na troca de quem fala (não deslize de um pro outro). Se as duas falam ao mesmo tempo por mais de 1,5 s, use tela dividida vertical: uma pessoa em cima (y = 0 a 960), a outra embaixo (y = 960 a 1920).
  - Gravação já vertical: use direto.

### Fase 3: revisão

Abra o Studio do corte 01 primeiro e passe a lista dos outros. A pessoa pode revisar um por um ("abre o 2"). Aprovação vale por corte: "pode exportar o 1 e o 3" exporta só esses. "Pode exportar todos" exporta todos.

### Fase 4: exportação

Cada corte aprovado vira `edit/cortes/NN-titulo-curto.mp4` (e os stems na pasta do subprojeto). O `relatorio.md` geral lista todos os cortes, as notas e o que foi feito em cada um.

## Ritmo e corte

- Regras de limpeza do motor dentro de cada corte, com pausas acima de 200 ms reduzidas pra ~90 ms.
- Corte de 30 a 60 s (ou o que a pessoa escolheu). Os primeiros 2 s precisam ter fala (nunca começar em silêncio ou "então...").

## Layouts

### A. Pessoa em tela cheia (principal, ~60%)

Reenquadrada como descrito acima.

### B. Dividido (gráfico em cima, pessoa embaixo, ~25%)

- Metade de cima (y = 0 a 960): tela gráfica no Kit Noite.
- Metade de baixo: a pessoa, reenquadrada pra 1080 × 960.
- Divisa reta.

### C. Animação em tela cheia (~15%)

Tela inteira no Kit Noite com a pessoa só na voz.

Regras: gancho em A com título. Número, lista, passos → B ou C. Opinião e história → A. Nunca 3 trechos seguidos no mesmo layout.

## Direção visual

Kit Noite (`maquina-de-edicao/referencias/kit-noite.md`), sem textura de pontos.

## Gráficos

Do Kit Noite: pílulas de passo numeradas ("1 Primeiros três segundos" com o número num círculo laranja e linha vertical ligando os passos), contadores grandes ("Dia 30" com o número em laranja), grade de dias, gráfico de linha, cards de vidro. Um elemento principal por tela, entrando com a palavra que o nomeia.

Também: **número gigante sobre a pessoa** (no layout A): Inter 700, 200 px, laranja `#E0894A`, com rótulo pequeno em cima ("Dia"), centro em y = 500, aparecendo no instante em que o número é dito e ficando até o fim da frase.

## Legendas

Legenda padrão do Kit Noite, centro em y = 1180 no layout A, em y = 900 no B (logo acima da divisa) e em y = 1130 no C.

## Capa e gancho

Título de duas linhas no topo, do quadro 0 até o fim da primeira frase:

- Linha 1: Inter 800, 70 px, branca, sombra suave, centro em y = 330.
- Linha 2: Inter 800, 70 px, preta `#0A0A0A` sobre caixa branca justa (padding 8 × 16 px, raio 4 px), centro em y = 420.
- Texto: a promessa ou a tensão do corte em até 8 palavras ("Não é o seu conteúdo. / É o seu sistema.").

## Chamada para ação

Se o trecho original tiver chamada para ação, mantenha só se ela fizer sentido sozinha. Não crie chamada que a pessoa não falou.

## Áudio

- Música: eletrônica escura, 105–115 BPM, igual em todos os cortes (variação de timbre por corte pra não ficarem idênticos). ~−24 LUFS.
- Efeitos: os do Kit Noite. Riser de 1,5 s terminando no fim do gancho de cada corte.
- Se o áudio original tiver música própria por baixo, não adicione música.

## Saída

- `edit/cortes/01-titulo.mp4`, `edit/cortes/02-titulo.mp4`... em 1080 × 1920, 60 fps, H.264 + AAC 48 kHz.
- `edit/ranking.md` e `edit/relatorio.md`.

## Verificação do formato

- Cada corte entendível sozinho (leia a transcrição final do corte sem o resto do vídeo).
- Nenhum corte começando ou terminando no meio de uma palavra ou de uma ideia.
- O rosto de quem fala sempre dentro do recorte vertical, sem cortar testa ou queixo.
- Sem trancos no reenquadramento.
- Nenhum trecho repetido entre dois cortes.
- Os arquivos numerados na ordem do ranking aprovado.
