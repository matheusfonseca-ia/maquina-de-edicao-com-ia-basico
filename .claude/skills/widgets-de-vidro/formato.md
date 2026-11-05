# Widgets de Vidro

Resumo: você em tela cheia com widgets de vidro fosco flutuando em volta da cabeça, cards de vidro líquido com gráfico subindo e número contando, e aproximações nos cantos com um gráfico ao lado da cabeça.

O visual descrito aqui (cores, fontes, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, os efeitos, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md` e a regra de cor de `maquina-de-edicao/referencias/efeitos-de-video.md`.

Formato de efeito: a imagem da câmera sai do `fx.py` original. Siga `maquina-de-edicao/referencias/efeitos-de-video.md` do começo ao fim.

## Como fica

Visual de interface de celular, todo em vidro. No gancho, widgets de vidro fosco aparecem em volta da cabeça (um número grande, o perfil da pessoa, uma barra de render, uma música tocando, um calendário), com a pessoa na frente. Quando a fala traz um número que cresce, um card de vidro líquido aparece no peito com a linha verde subindo e o número contando. Num resultado com vários números, a tela de vidro vai pra trás da cabeça e blocos de vidro (rosca, número, barras) ficam na frente. Na comparação de dois números, a câmera aproxima num canto com um gráfico, volta e aproxima no outro.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Básico do motor: só câmera cheia, sem gráficos HyperFrames), visual original da legenda (trocado se a pessoa escolher outro estilo visual), capa (quadro do gancho já montado), verificação de fontes (desligada).

## Base técnica

- Segue `efeitos-de-video.md`: câmera limpa → plano → conferência por quadros → render do `fx.py` → composição.
- `over-the-shoulder-zoom` mexe a câmera (aproximação até 2×): vale dentro da janela dele.
- Não vale: layouts B e C, câmera virtual do HyperFrames, contato visual obrigatório, gráficos HyperFrames.
- Câmera e efeitos a 30 fps (limite do `fx.py`).

## Entradas extras

- Nome e @ da pessoa (veja "Dados da pessoa" em `efeitos-de-video.md`).
- Números de verdade: só use os que a pessoa falou ou escreveu nas observações. Sem número nenhum, o vídeo usa só o `glass-widgets` no gancho e no fechamento, com o número de um fato da fala (ex: "10" de "10 formatos").

## Ritmo e corte

- Regras de limpeza do motor.
- Um efeito a cada 8 a 12 s, no máximo 6 por minuto. Entre dois efeitos, pelo menos 2 s de câmera limpa.

## Layouts

Um só: câmera cheia (a câmera limpa com os efeitos do `fx.py`), legenda por cima.

## Direção visual

- Vidro e verde dos gráficos como no original, em qualquer estilo (o verde é o papel de "cresceu").
- O `glass-widgets` aplica uma leve correção de cor quente na janela dele (original do efeito).
- Fontes da legenda: Inter 600 e Instrument Serif itálico, locais.

## Gráficos

| Momento da fala | Efeito | Opções | Janela |
|---|---|---|---|
| Gancho (primeira frase) | `glass-widgets` | `text` = número curto da fala; `title` = assunto (1 palavra); `sub` = 2 linhas curtas com `\|`; `name`, `handle`; `song` = nome da música do vídeo ou "Máquina de Edição"; `event` = próximo passo citado (até 22 caracteres); `day` e `date` = dia da semana (3 letras) e dia do mês de hoje | 3 a 4 s |
| Número que cresce ("de 2 mil pra 50 mil", "subiu 59%") | `liquid-glass-graph` | `text` = o que é (1 a 2 palavras, CAIXA ALTA); `from`, `to` = os números da fala | 3 a 4 s, terminando na fala do número final |
| Resultado com vários números | `liquid-glass-graph` com `look=bento` | `text`, `from`, `to`; `donut`, `kpi`, `bars` com números da fala | 3,5 a 4 s |
| Comparação de dois números relacionados ("197 mil numa semana, 672 mil no mês") | `over-the-shoulder-zoom` | `text` = `rótulo 1\|rótulo 2`; `to` = `n1\|n2` | 5 a 6 s |
| Fechamento (opcional, se houver número de resultado) | `glass-widgets` com `look=simple` | `text`, `name`, `handle`, `title`, `sub`, `label`, `pill` = `Editado com a\|Máquina` | 3 a 4 s |

Números no formato curto: "51K", "1,2M", "59%". No `bento`, `bars` usa números sem unidade e o rótulo depois de `::`.

## Legendas

- Inter 600, 56 px, branca, sombra `0 4px 18px rgba(0,0,0,0.7)`.
- De 2 a 3 palavras por bloco, troca seca.
- Centralizada em x, centro em y = 1520.
- Destaque a cada 2–3 blocos: palavra em Instrument Serif itálico, 1,3× o tamanho, verde `#34D36E`, brilho `0 0 24px rgba(52,211,110,0.4)`.
- Some durante todos os efeitos deste formato.

## Capa e gancho

Quadro 0: o quadro de conferência do `glass-widgets` do gancho com todos os widgets na tela (PNG do `--still`), só no quadro 0, sem título extra.

## Chamada para ação

A de `efeitos-de-video.md` (`comment-box` ou `tap`).

## Áudio

- Música: eletrônica suave de interface, 105–115 BPM, sintetizador limpo. ~−24 LUFS.
- Efeitos: impacto abafado na entrada dos widgets, confirmação no fim de cada contagem. Sem riser.

## Saída

`edit/final.mp4`, 1080 × 1920, na taxa de exportação escolhida (a câmera fica a 30 fps), H.264 + AAC 48 kHz.

## Verificação do formato

- Nenhum widget com texto padrão da autora (nome, @, "22 effects", "Post 2 reels").
- Números iguais aos da fala.
- A cabeça fica na frente dos widgets de trás, sem halo de recorte.
