# Checklist na Tela

Resumo: você em tela cheia e a lista do que você fala aparecendo na tela, com cada item ganhando ✓ na hora em que é falado; nos vídeos de "N coisas", abre com um relógio 3, 2, 1 acima da cabeça.

O visual descrito aqui (cores, fontes, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, os efeitos, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md` e a regra de cor de `maquina-de-edicao/referencias/efeitos-de-video.md`.

Formato de efeito: a imagem da câmera sai do `fx.py` original. Siga `maquina-de-edicao/referencias/efeitos-de-video.md` do começo ao fim.

## Como fica

Feito pra vídeo de lista, passo a passo e "N coisas que...". A gravação fica em tela cheia. Quando a pessoa anuncia quantas coisas vai falar, um relógio de virar 3, 2, 1 aparece acima da cabeça. Enquanto ela percorre a lista, um card de lista fica ao lado da cabeça e cada item é riscado com ✓ verde no segundo em que ela fala dele. Em coisas que se ligam ou se ativam, um card de ajustes do iPhone liga as chaves uma por uma. Num resumo rápido de processo, uma lista de tarefas aparece embaixo do queixo e cada passo gira e fica verde.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Básico do motor: só câmera cheia, sem gráficos HyperFrames), visual original da legenda (trocado se a pessoa escolher outro estilo visual), capa (quadro do gancho já montado), verificação de fontes (desligada).

## Base técnica

- Segue `efeitos-de-video.md`: câmera limpa → plano → conferência por quadros → render do `fx.py` → composição.
- `todo` e `apple-toggles` podem durar a lista inteira (até 20 s), acima do limite geral de 4 s.
- Não vale: layouts B e C, câmera virtual, contato visual obrigatório, gráficos HyperFrames.
- Câmera e efeitos a 30 fps (limite do `fx.py`).

## Entradas extras

Nenhuma. Se a fala não tiver lista nenhuma, avise no resumo da fase 1 que o formato combina pouco com essa gravação e sugira Palavra Atrás da Cabeça ou Marcações; siga com o que a pessoa escolher.

## Ritmo e corte

- Regras de limpeza do motor.
- Entre o fim de uma lista e o começo do próximo efeito, pelo menos 2 s de câmera limpa.

## Layouts

Um só: câmera cheia (a câmera limpa com os efeitos do `fx.py`), legenda por cima.

## Direção visual

- Marcação de concluído sempre verde, como no original, em qualquer estilo (é cor com papel fixo).
- Títulos e itens em português, curtos: item com até 22 caracteres, título com até 14.
- Fontes da legenda: Inter 700 e Instrument Serif itálico, locais.

## Gráficos

Primeiro, ache as listas na transcrição: itens anunciados ("são três coisas"), enumerados ("primeiro", "segundo", "e por último") ou passos em sequência. Cada item vira uma linha curta com as palavras da fala.

| Momento da fala | Efeito | Opções | Janela |
|---|---|---|---|
| Anúncio da quantidade ("3 coisas", "5 passos"), de 2 a 9 | `countdown-flip` | `from` = a quantidade | 2 a 3 s, começando no número |
| Lista falada item por item | `todo` | `title` = o tema ("HOJE", "PRA FAZER", "FERRAMENTAS"); `text` = itens com `\|`; `ticks` = segundo em que cada item começa a ser falado | do primeiro item até 1 s depois do último tique |
| Itens que a pessoa liga, ativa ou configura ("liga a legenda", "ativa o modo X") | `apple-toggles` | `text` = itens; `ticks` = segundo de cada item | do primeiro item até 1 s depois do último |
| Resumo rápido de um processo ("ele corta, legenda, exporta") ou o que uma ferramenta faz sozinha | `checklist` | `title` = quem faz ("Claude", "A Máquina"); `text` = `passo::detalhe` (detalhe de 1 palavra) | 3 a 4 s |

Uma lista por efeito, no máximo 5 itens. Lista maior: divida em dois efeitos ou fique com os 5 mais importantes.

## Legendas

- Inter 700, 58 px, branca, sombra `0 4px 16px rgba(0,0,0,0.7)`.
- De 2 a 3 palavras por bloco, troca seca.
- Centralizada em x, centro em y = 1540.
- Destaque a cada 2–3 blocos: palavra em Instrument Serif itálico, 1,15× o tamanho, verde `#34C759`.
- Continua durante `todo`, `apple-toggles` e `countdown-flip`; some durante `checklist` (a lista ocupa o peito).

## Capa e gancho

Quadro 0: o quadro de conferência da primeira lista já completa (todos os ✓ marcados, PNG do `--still` no último tique), só no quadro 0, sem título extra. Sem lista no começo: o quadro do `countdown-flip`.

## Chamada para ação

A de `efeitos-de-video.md` (`comment-box` ou `tap`).

## Áudio

- Música: eletrônica leve e organizada, 100–110 BPM. ~−24 LUFS.
- Efeitos: confirmação no último ✓ de cada lista, clique na primeira chave do `apple-toggles`. Nada nos tiques intermediários. Sem riser.

## Saída

`edit/final.mp4`, 1080 × 1920, na taxa de exportação escolhida (a câmera fica a 30 fps), H.264 + AAC 48 kHz.

## Verificação do formato

- Cada ✓ cai até 2 quadros depois do início da fala do item.
- Itens da lista iguais à fala, sem item inventado.
- Card da lista sem cobrir o rosto em nenhum quadro.
