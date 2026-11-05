# Marcações

Resumo: você em tela cheia e marcações feitas por cima da imagem: a imagem congela com uma seta à mão apontando, uma fita amarela com a frase cola no peito, uma caixa de seleção agarra o número e um cursor aumenta, rabiscos de marcador desenham em volta.

O visual descrito aqui (cores, fontes, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, os efeitos, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md` e a regra de cor de `maquina-de-edicao/referencias/efeitos-de-video.md`.

Formato de efeito: a imagem da câmera sai do `fx.py` original. Siga `maquina-de-edicao/referencias/efeitos-de-video.md` do começo ao fim.

## Como fica

Parece que alguém pegou a caneta e anotou em cima do vídeo. A gravação fica em tela cheia e, nos momentos certos: a imagem pausa (com o selo de pausa no canto) e uma seta à mão amarela aponta pra pessoa com uma palavra escrita; uma fita adesiva amarela com uma frase curta cola no peito; um número aparece acima da cabeça dentro de uma caixa de seleção azul e um cursor arrasta pra aumentar; rabiscos amarelos (círculo, cruzinhas, seta) se desenham em volta.

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
- Uma marcação a cada 6 a 10 s, no máximo 7 por minuto. Varie: nunca o mesmo efeito duas vezes seguidas.

## Layouts

Um só: câmera cheia (a câmera limpa com os efeitos do `fx.py`), legenda por cima.

## Direção visual

- Seta e rabiscos (`pause-point`, `scribble`): amarelo original no Original do formato (sem `color`); com outro estilo, `color` = cor de destaque.
- Fita (`tape-label`) e caixa de seleção (`select-resize`): como no original, em qualquer estilo.
- Fontes da legenda: Inter 700 e Permanent Marker (a mesma letra da seta), locais.

## Gráficos

| Momento da fala | Efeito | Opções | Janela |
|---|---|---|---|
| Gancho, ou quando a pessoa fala de si ("esse sou eu", "eu fiz isso", "olha pra mim") | `pause-point` | `text` = 1 a 2 palavras ("EU", "O EDITOR"); `label_x` 0,2 a 0,8 pra seta não cruzar o rosto | 2 a 3 s |
| Promessa ou resumo curto ("sem editor", "em 10 minutos", "de graça") | `tape-label` | `text` até 22 caracteres | 2,5 a 3,5 s |
| Número citado ("10 vezes", "3 mil", "R$ 67") | `select-resize` | `text` = o número escrito curto ("10X", "3 MIL", "R$67") | 2 a 3 s |
| Ênfase em "isso", "aqui", "esse detalhe" | `scribble` | `text` = 1 palavra | 2 a 3 s |

O gancho sempre abre com `pause-point` ou `tape-label`.

## Legendas

- Inter 700, 58 px, branca, sombra `0 4px 16px rgba(0,0,0,0.7)`.
- De 2 a 3 palavras por bloco, troca seca.
- Centralizada em x, centro em y = 1520.
- Destaque a cada 2–3 blocos: palavra em Permanent Marker, 1,1× o tamanho, amarelo `#FFD60A`.
- Some durante `tape-label` e `scribble`; continua durante `pause-point` e `select-resize`.

## Capa e gancho

Quadro 0: o quadro de conferência do primeiro efeito já montado (PNG do `--still`), só no quadro 0, sem título extra.

## Chamada para ação

A de `efeitos-de-video.md` (`comment-box` ou `tap`).

## Áudio

- Música: eletrônica leve e brincalhona, 100–110 BPM, com pizzicato ou marimba. ~−24 LUFS.
- Efeitos: clique no congelamento do `pause-point`, clique ao soltar no `select-resize`. Fita e rabisco sem som.

## Saída

`edit/final.mp4`, 1080 × 1920, na taxa de exportação escolhida (a câmera fica a 30 fps), H.264 + AAC 48 kHz.

## Verificação do formato

- Seta, rabisco e fita nunca sobre os olhos ou a boca.
- O número da caixa de seleção é o número falado.
- O congelamento do `pause-point` não corta a voz (o áudio continua normal).
