# Palavra Atrás da Cabeça

Resumo: você em tela cheia e, nas palavras mais fortes da fala, uma palavra gigante caindo atrás da sua cabeça; quando a fala descarta alguma coisa, a palavra é riscada em vermelho, e a ideia principal é escrita a giz de cera.

O visual descrito aqui (cores, fontes, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, os efeitos, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md` e a regra de cor de `maquina-de-edicao/referencias/efeitos-de-video.md`.

Formato de efeito: a imagem da câmera sai do `fx.py` original. Siga `maquina-de-edicao/referencias/efeitos-de-video.md` do começo ao fim.

## Como fica

A gravação ocupa a tela toda, sem gráfico nenhum na maior parte do tempo. Quando a pessoa fala uma palavra forte, ela cai gigante atrás da cabeça, ocupando a largura da tela, com o cabelo e os ombros na frente. Quando a fala descarta alguma coisa ("esquece o editor", "não é sobre isso"), a palavra entra em serifa enorme e um risco vermelho atravessa. Na ideia principal do vídeo, um giz de cera vermelho escreve a palavra atrás da cabeça e sublinha. Legenda limpa na altura do peito.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Básico do motor: só câmera cheia, sem gráficos HyperFrames), visual original da legenda (trocado se a pessoa escolher outro estilo visual), capa (quadro do gancho já montado), verificação de fontes (desligada).

## Base técnica

- Segue `efeitos-de-video.md`: câmera limpa → plano → conferência por quadros → render do `fx.py` → composição.
- Não vale: layouts B e C, câmera virtual, contato visual obrigatório, gráficos HyperFrames.
- Câmera e efeitos a 30 fps (limite do `fx.py`).

## Entradas extras

Nenhuma.

## Ritmo e corte

- Regras de limpeza do motor.
- Um efeito a cada 6 a 10 s de fala, no máximo 8 por minuto. Entre dois efeitos, pelo menos 2 s de câmera limpa.

## Layouts

Um só: câmera cheia (a câmera limpa com os efeitos do `fx.py`), legenda por cima.

## Direção visual

- Palavra gigante (`backdrop-word`): no Original, sem `color` (fica o creme original) e `font` = `bold`. Use `font` = `serif` quando a palavra for nome próprio, marca ou sentimento (ex: "liberdade").
- Risco (`huge-strike`) e giz de cera (`crayon-write`): vermelhos, como no original, em qualquer estilo.
- Fontes da legenda: Inter 700 e Instrument Serif itálico, locais.

## Gráficos

Escolha da palavra: substantivo, verbo forte, nome de produto ou número curto, dito com ênfase. Nunca artigo, preposição, pronome ou conectivo. Até 10 letras, em CAIXA ALTA no `backdrop-word` e como a pessoa falou no `huge-strike` e no `crayon-write`.

| Momento da fala | Efeito | Janela |
|---|---|---|
| Gancho (primeira frase) | `backdrop-word` com a palavra mais forte da frase | começa no início da palavra, 2,5 a 3,5 s |
| Palavra-chave de cada ideia | `backdrop-word` | 2 a 3 s |
| A fala descarta, nega ou compara ("não é X", "esquece X", "X morreu", "em vez de X") | `huge-strike` com X; `at` = segundos até a palavra que nega (padrão 0,6) | 2,5 a 3,5 s |
| A ideia principal do vídeo (uma vez, normalmente na segunda metade) | `crayon-write` | 3 a 4 s |

No máximo 2 `huge-strike` e 1 `crayon-write` por vídeo. Nunca o mesmo efeito com a mesma palavra duas vezes.

## Legendas

- Inter 700, 58 px, branca, sombra `0 4px 16px rgba(0,0,0,0.7)`.
- De 2 a 3 palavras por bloco, troca seca.
- Centralizada em x, centro em y = 1500.
- Destaque a cada 2–3 blocos: palavra em Instrument Serif itálico, 1,15× o tamanho, pêssego `#FFB7A5`. A palavra que está atrás da cabeça naquele momento nunca é destacada na legenda (já está gigante).
- Na janela dos efeitos deste formato a legenda continua.

## Capa e gancho

O vídeo abre com o `backdrop-word` do gancho. Quadro 0: o quadro de conferência do gancho com a palavra já caída (o PNG do `--still` no fim da janela), em tela cheia, só no quadro 0, sem título extra.

## Chamada para ação

A de `efeitos-de-video.md` (`comment-box` ou `tap`).

## Áudio

- Música: eletrônica minimalista, 100–110 BPM, bumbo leve e baixo arredondado, sem melodia principal. ~−24 LUFS.
- Efeitos: impacto abafado na queda de cada palavra, risco curto no `at` do `huge-strike`. Sem riser.

## Saída

`edit/final.mp4`, 1080 × 1920, na taxa de exportação escolhida (a câmera fica a 30 fps), H.264 + AAC 48 kHz.

## Verificação do formato

- A palavra fica atrás da cabeça e dos ombros em todos os quadros da janela, sem cobrir o rosto.
- Nenhuma palavra cortada nas bordas.
- Cada palavra gigante é exatamente a palavra falada naquele momento.
