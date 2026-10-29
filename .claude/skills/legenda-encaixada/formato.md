# Legenda Encaixada

Resumo: só você e a legenda; a frase vai se montando palavra por palavra, e a palavra mais forte de cada frase aparece gigante em serifa itálica laranja, com as palavras pequenas encaixadas em volta dela.

O visual descrito aqui (cores, fontes, materiais, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, o layout, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md`.

## Como fica

Vídeo sem gráfico nenhum: o trabalho todo está na tipografia. A legenda fica na altura do peito, as palavras vão se acumulando na linha conforme a pessoa fala, e quando chega a palavra-chave ela entra enorme, em serifa itálica laranja, e as palavras pequenas da frase se reorganizam em volta dela (em cima à esquerda, embaixo à direita), como numa capa de revista. A parte de baixo da imagem escurece um pouco pra legenda ler bem.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (Básico), visual original da legenda (trocado se a pessoa escolher outro estilo visual; não tem gráficos), capa (frase encaixada no quadro 0), verificação de fontes (desligada).

## Base técnica

- Nível Básico do motor: só câmera em tela cheia, sem layouts B e C, sem contato visual obrigatório.
- Render a 60 fps direto.

## Entradas extras

Nenhuma.

## Ritmo e corte

Regras de limpeza do motor, com pausas acima de 220 ms reduzidas pra ~100 ms.

## Layouts

Só câmera cheia: gravação em 1080 × 1920 por recorte proporcional, sem zoom.

Por cima da gravação, um gradiente de escurecimento: transparente em y = 900 até `rgba(0,0,0,0.45)` em y = 1920. Fixo, o vídeo todo.

## Direção visual

- Fontes: Inter (600, 700) e Instrument Serif itálico, locais.
- Palavras normais: branco `#FFFFFF`.
- Palavra encaixada: laranja `#D9822B`.
- Sombra em tudo: `0 4px 20px rgba(0,0,0,0.6)`.

## Gráficos

Nenhum.

## Legendas

Este formato **é** a legenda.

### Frase acumulando (padrão)

- Inter 700, 54 px, branca.
- As palavras entram uma a uma no instante em que são ditas e **ficam** na linha até a frase acabar (efeito de "digitando falado").
- A linha fica centralizada em x, com o centro em y = 1065 (altura do pescoço/clavícula). Se a frase passar de ~22 caracteres, quebra pra uma segunda linha logo abaixo (entrelinha 1,1).
- No fim da frase, tudo some de uma vez (corte seco) e a próxima frase começa vazia.

### Frase encaixada (o destaque)

Uma frase a cada 2 ou 3 tem uma palavra-chave (a que carrega o sentido: o conceito, o resultado, o nome do passo). Quando essa palavra é dita:

- Ela entra em **Instrument Serif itálico, 200 px, laranja**, com escala 0,9 → 1 e fade em 0,22 s (power3.out), centralizada em x, centro em y = 1110.
- As palavras pequenas que vieram antes dela se reposicionam (0,22 s, power2.inOut) pra ficar **em cima e à esquerda** da palavra grande, em Inter 700 44 px, alinhadas à borda esquerda da palavra grande, encostadas no topo dela (sobreposição de ~10 px).
- As palavras que vierem depois dela entram **embaixo e à direita**, Inter 700 44 px, alinhadas à borda direita da palavra grande.
- Se a palavra-chave tiver mais de 9 letras, reduza até ela caber em 1080 − 2 × 70 px (mínimo 150 px).

Exemplos de composição:

Frase "É o seu sistema." (palavra-chave no fim):

```
É o seu
sistema.            ← serifa itálica laranja gigante
```

Frase "E observa o que acontece." (palavra-chave no meio):

```
E
observa             ← serifa itálica laranja gigante
     o que acontece.
```

Regras:

- Nunca duas frases encaixadas seguidas.
- A palavra encaixada nunca é artigo, preposição, conjunção ou pronome.
- A palavra encaixada leva a pontuação do fim da frase colada nela ("sistema.", "oferta.").
- A legenda nunca cobre os olhos ou a boca. Se a pessoa estiver muito baixa no quadro, suba tudo até ficar 40 px abaixo do queixo.

## Capa e gancho

Quadro 0: a primeira frase encaixada do vídeo (a do gancho, se tiver palavra-chave; senão, a mais forte da primeira metade) já completa, servindo de capa. Depois do quadro 0 ela some e reaparece no tempo certo.

## Chamada para ação

Se houver "comenta X": frase encaixada com a palavra X gigante em laranja, "Comenta" em cima à esquerda e "aqui embaixo" embaixo à direita. Sem cartão.

## Áudio

- Música: piano minimalista com pad quente, 80–90 BPM, sem bateria. ~−25 LUFS.
- Efeitos: um "tum" suave e grave (seno de 70 Hz, 180 ms, 14 dB abaixo do pico da voz) na entrada de cada palavra encaixada. Nada mais. Sem riser.

## Saída

`edit/final.mp4`, 1080 × 1920, 60 fps, H.264 + AAC 48 kHz.

## Verificação do formato

- Cada palavra aparece no máximo 1 quadro antes de ser dita.
- Nenhuma palavra encaixada cortada na borda.
- Palavras pequenas sem colidir com a palavra grande (só a sobreposição de ~10 px prevista).
- Legenda sem cobrir olhos e boca em nenhum quadro.
