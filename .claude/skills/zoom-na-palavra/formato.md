# Zoom na Palavra

Resumo: você em tela cheia e a câmera reagindo à fala: aproximação rápida nas palavras fortes, mira travando no seu rosto, título com aproximação no gancho e uma aproximação lenta e desfocada no fechamento.

O visual descrito aqui (cores, fontes, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, os efeitos, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md` e a regra de cor de `maquina-de-edicao/referencias/efeitos-de-video.md`.

Formato de efeito: a imagem da câmera sai do `fx.py` original. Siga `maquina-de-edicao/referencias/efeitos-de-video.md` do começo ao fim.

## Como fica

A gravação em tela cheia, com a câmera "viva": nas palavras de impacto, um corte de aproximação rápido no rosto que volta logo em seguida; quando a fala aponta pra pessoa ("eu", "você", "olha só"), cantoneiras travam no rosto e a câmera acompanha; no gancho, um título de duas linhas aparece no topo enquanto a imagem aproxima; no fechamento, uma aproximação lenta com o fundo desfocando. Legenda grande e limpa.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Básico do motor: só câmera cheia, sem gráficos HyperFrames), visual original da legenda (trocado se a pessoa escolher outro estilo visual), capa (quadro do gancho já montado), verificação de fontes (desligada).

## Base técnica

- Segue `efeitos-de-video.md`: câmera limpa → plano → conferência por quadros → render do `fx.py` → composição.
- O zoom na câmera é a assinatura deste formato: vale dentro das janelas dos efeitos. Fora delas, câmera parada, sem zoom.
- Não vale: layouts B e C, câmera virtual do HyperFrames, contato visual obrigatório, gráficos HyperFrames.
- Câmera e efeitos a 30 fps (limite do `fx.py`).

## Entradas extras

Nenhuma.

## Ritmo e corte

- Regras de limpeza do motor.
- Uma aproximação a cada 4 a 7 s de fala, no máximo 12 por minuto. Nunca duas `lean-in` em palavras seguidas.

## Layouts

Um só: câmera cheia (a câmera limpa com os efeitos do `fx.py`), legenda por cima.

## Direção visual

- `headline-box`: título branco com a segunda linha numa caixa branca (original do efeito, em qualquer estilo).
- `locked-on`: cantoneiras brancas, `text` com uma etiqueta curta da fala em caixa alta (ex: "VOCÊ", "O SEGREDO"), até 12 letras.
- Fontes da legenda: Inter 800 e Instrument Serif itálico, locais.

## Gráficos

| Momento da fala | Efeito | Opções | Janela |
|---|---|---|---|
| Gancho (primeira frase) | `headline-box` | `text` = o tema em duas linhas curtas (`linha 1\|linha 2`, até 22 caracteres cada), tirado da fala; `zoom` 1,2 | 2,5 a 3,5 s |
| Palavra de impacto (número, "nunca", "todo dia", nome de produto, resultado) | `lean-in` | `zoom` 1,45 (até 1,7 nas mais fortes) | do início da palavra até 0,6 s depois do fim dela |
| A fala aponta pra pessoa ou revela algo ("eu fiz", "você", "olha só", "o segredo é") | `locked-on` | `text` = etiqueta curta; `zoom` 1,35 | 2 a 3 s |
| Fechamento (última frase antes da chamada pra ação) | `slow-push` | `zoom` 1,6 | 3 a 4 s |

No máximo 2 `locked-on` por vídeo. O `slow-push` aparece uma vez.

## Legendas

- Inter 800, 62 px, branca, sombra `0 4px 18px rgba(0,0,0,0.75)`.
- De 1 a 3 palavras por bloco, troca seca.
- Centralizada em x, centro em y = 1520.
- Destaque: a palavra da `lean-in` em amarelo `#FFD60A`, no mesmo tamanho.
- Na janela dos efeitos deste formato a legenda continua. Durante o `headline-box`, a legenda some (o título já está na tela).

## Capa e gancho

O vídeo abre com o `headline-box` do gancho. Quadro 0: o quadro de conferência do gancho com o título já montado (PNG do `--still`), só no quadro 0, sem título extra.

## Chamada para ação

A de `efeitos-de-video.md` (`comment-box` ou `tap`).

## Áudio

- Música: eletrônica energética, 115–125 BPM, bateria seca. ~−24 LUFS.
- Efeitos: impacto abafado no `headline-box`, clique na trava do `locked-on`. As `lean-in` não levam som (o corte já é o impacto). Sem riser.

## Saída

`edit/final.mp4`, 1080 × 1920, na taxa de exportação escolhida (a câmera fica a 30 fps), H.264 + AAC 48 kHz.

## Verificação do formato

- Nenhuma aproximação passa de 2× nem corta a testa ou o queixo.
- Cada `lean-in` cai na palavra certa (a aproximação começa até 2 quadros depois do início da palavra).
- Fora das janelas, a câmera está parada e sem zoom.
