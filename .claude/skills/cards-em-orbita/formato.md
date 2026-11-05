# Cards em Órbita

Resumo: você em tela cheia e os seus cards (posts, capas de reels, prints) girando em volta da cabeça, passando na frente e atrás de você, num carrossel 3D, abrindo em leque atrás da cabeça ou como celulares em leque no peito.

O visual descrito aqui (cores, fontes, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, os efeitos, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md` e a regra de cor de `maquina-de-edicao/referencias/efeitos-de-video.md`.

Formato de efeito: a imagem da câmera sai do `fx.py` original. Siga `maquina-de-edicao/referencias/efeitos-de-video.md` do começo ao fim.

## Como fica

Feito pra mostrar volume: muitos vídeos, muitas ferramentas, muitos resultados. Quando a fala fala de quantidade, os cards entram: giram em órbita em volta da cabeça (embaixo passam na frente, em cima passam atrás), rodam num carrossel 3D que desacelera até parar, abrem em leque atrás da cabeça um por vez ou aparecem como celulares em leque no peito com um título de duas linhas no topo.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Básico do motor: só câmera cheia, sem gráficos HyperFrames), visual original da legenda (trocado se a pessoa escolher outro estilo visual), capa (quadro do gancho já montado), verificação de fontes (desligada).

## Base técnica

- Segue `efeitos-de-video.md`: câmera limpa → plano → conferência por quadros → render do `fx.py` → composição.
- Não vale: layouts B e C, câmera virtual, contato visual obrigatório, gráficos HyperFrames.
- Câmera e efeitos a 30 fps (limite do `fx.py`).

## Entradas extras

Imagens dos cards, nesta ordem de preferência:

1. As da pessoa: pasta `imagens/` (subidas pelo painel ou já na pasta), com prints de posts, capas de reels ou telas. Vídeos curtos também servem (o `fx.py` pega um quadro).
2. Imagens do que a fala cita (logos, telas de ferramentas, notícias), buscadas seguindo a ordem de origem de `maquina-de-edicao/referencias/formatos-prontos.md`, salvas em `imagens/` em retrato (proporção 9:16 ou 4:5).
3. Sem nada disso: deixe sem `images` e o `fx.py` usa 10 quadros do próprio vídeo. Registre no relatório.

Use de 6 a 12 imagens. Passe a pasta inteira em `images`, com caminho absoluto.

## Ritmo e corte

- Regras de limpeza do motor.
- Um efeito a cada 8 a 12 s, no máximo 5 por minuto. Entre dois efeitos, pelo menos 2 s de câmera limpa.

## Layouts

Um só: câmera cheia (a câmera limpa com os efeitos do `fx.py`), legenda por cima.

## Direção visual

- Cards como no original, em qualquer estilo (as imagens são o conteúdo).
- Fontes da legenda: Inter 700 e Instrument Serif itálico, locais.

## Gráficos

| Momento da fala | Efeito | Opções | Janela |
|---|---|---|---|
| Gancho ou "olha tudo isso", "todos esses vídeos" | `orbit` | `images`; `count` 6 a 8 | 3 a 4 s |
| Quantidade grande ou variedade ("são 20 formatos", "testei várias") | `carousel-spin` | `images`; `count` 8 a 12; `turns` 1,1 | 3,5 a 4 s |
| Uma coisa depois da outra ("fiz um, depois outro…") | `fan-build` | `images`; `count` 8 a 13 | 3 a 4 s |
| Resultado com título ("10 formatos, 1 comando") | `phone-fan` | `images`; `text` = duas linhas curtas da fala com `\|` | 3 a 4 s |

Não repita o mesmo efeito em seguida. O `phone-fan` aparece no máximo uma vez.

## Legendas

- Inter 700, 58 px, branca, sombra `0 4px 16px rgba(0,0,0,0.7)`.
- De 2 a 3 palavras por bloco, troca seca.
- Centralizada em x, centro em y = 1540.
- Destaque a cada 2–3 blocos: palavra em Instrument Serif itálico, 1,15× o tamanho, branco quente `#FFE7C2`.
- Continua durante `fan-build`; some durante `orbit`, `carousel-spin` e `phone-fan`.

## Capa e gancho

Quadro 0: o quadro de conferência do efeito do gancho com os cards já em volta (PNG do `--still`), só no quadro 0, sem título extra.

## Chamada para ação

A de `efeitos-de-video.md` (`comment-box` ou `tap`).

## Áudio

- Música: eletrônica com movimento, 110–120 BPM, arpejo. ~−24 LUFS.
- Efeitos: impacto abafado na parada do `carousel-spin` e na entrada do `phone-fan`. Órbita e leque sem som. Sem riser.

## Saída

`edit/final.mp4`, 1080 × 1920, na taxa de exportação escolhida (a câmera fica a 30 fps), H.264 + AAC 48 kHz.

## Verificação do formato

- Os cards de trás passam atrás da cabeça e os da frente não cobrem o rosto.
- Nenhuma imagem de terceiro com marca d'água ou texto ilegível.
- Origem das imagens registrada no relatório.
