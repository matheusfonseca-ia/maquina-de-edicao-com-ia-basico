# Formato Ranking

Resumo: tier list (S, A, B, C, D, E, F) na frente do seu peito que vai se preenchendo conforme você ranqueia cada coisa; cada item entra como um card grande e depois encolhe até a fileira da nota que você deu.

O visual descrito aqui (cores, fontes, materiais, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, o layout, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md`.

## Como fica

A pessoa em tela cheia, com o tema do ranking escrito no topo em laranja. Na frente do peito, um quadro de tier list com as fileiras coloridas de S a F. Quando a pessoa começa a falar de um item, ele aparece como um card grande com imagem e nome, por cima do quadro. Quando ela dá a nota ("isso é nota F"), o card encolhe e voa até a fileira certa, onde fica. No fim, o quadro está completo e serve de resumo do vídeo.

## Escolhas que este formato já define

Proporção (vertical 9:16), nível (equivale ao Com imagens, com o layout próprio), visual original da legenda e dos gráficos (trocado se a pessoa escolher outro estilo visual), capa (quadro completo no quadro 0), verificação de fontes (desligada; o ranking é opinião).

## Base técnica

- Só câmera cheia como fundo. Não vale: layouts B e C do motor, câmera virtual, contato visual obrigatório.
- Render a 60 fps direto.

## Entradas extras

Nenhuma obrigatória. Pasta `imagens/` tem prioridade pra imagem de cada item (nome do arquivo igual ou parecido com o nome do item).

### Entender o ranking (antes de construir)

Depois da transcrição, monte em `edit/plano.md` a tabela do ranking:

| Item | Início da fala sobre ele | Momento da nota | Nota (S–F) | Frase que justifica |
|---|---|---|---|---|

- Item: a coisa ranqueada (ex: "Postar todo dia", "Áudio em alta", "Carrossel").
- Nota: a que a pessoa disse. Se ela disser só "topo", "a melhor", use S; "ótimo" → A; "bom" → B; "mais ou menos" → C; "fraco" → D; "ruim" → E; "lixo", "o pior" → F. Registre a interpretação no relatório.
- Se o vídeo não tiver notas claras, avise no fim da edição que o vídeo não parece um ranking e use o melhor palpite registrado no relatório (não pare a edição).
- Tema do ranking: o assunto geral, em até 3 palavras ("Táticas de conteúdo").

## Ritmo e corte

Regras de limpeza do motor. Nada mais.

## Layouts

Só câmera cheia: gravação em 1080 × 1920 por recorte proporcional, sem zoom.

Por cima:

- **Tema** no topo: centro em y = 315.
- **Quadro de tier list**: x = 150, y = 995, largura 780 px, altura 505 px.
- **Legenda**: centro em y = 935, logo acima do quadro.

Se o queixo da pessoa estiver abaixo de y = 980, desça o quadro até ficar 20 px abaixo do queixo (no máximo y = 1180).

## Direção visual

- Fontes: **Archivo** 800 itálico (títulos e legendas) e **Lilita One** (nomes dos itens nos cards), do Google Fonts, locais.
- Tema: Archivo 800 itálico, 70 px, caixa alta, laranja `#F07A2A`, sombra `0 4px 16px rgba(0,0,0,0.5)`.
- Quadro: fundo `#141416` com 92% de opacidade, borda 3 px `#000000`, sem raio. Sete fileiras iguais (72 px cada) separadas por linhas de 2 px `#000000`.
- Rótulos das fileiras (quadrado de 52 × 72 px à esquerda, letra em Archivo 800 32 px `#111111`):

| Nota | Cor |
|---|---|
| S | `#FF7F7F` |
| A | `#FFBF7F` |
| B | `#FFDF7F` |
| C | `#BFFF7F` |
| D | `#7FBFFF` |
| E | `#7F7FFF` |
| F | `#FF7FFF` |

## Gráficos

### Card de item (grande)

- 580 × 340 px, centralizado sobre o quadro (centro em x = 540, y = 1240), raio 6 px, borda 3 px `rgba(255,255,255,0.85)`.
- Fundo: a imagem do item (seguindo a ordem de origem de `formatos-prontos.md`) com escurecimento de 35% embaixo; se não houver imagem boa, use um fundo de cor sólida escura (azul `#1E3A5F`, roxo `#4A1D5C`, verde `#1F4D2E` ou vinho `#5C1D2A`, alternando) com um ícone simples branco grande no meio.
- Nome do item: Lilita One, 86 px, amarelo `#FFE14D`, caixa alta, contorno 4 px `#111111`, centralizado na parte de baixo do card (até 2 linhas).
- Etiqueta minúscula "SUA IMAGEM" ou a origem no canto superior esquerdo em Inter 500 14 px, só se a imagem for de terceiro.

### Animação

1. **Entrada**: quando a pessoa começa a falar do item, o card entra com escala 0,7 → 1 e fade em 0,35 s (back.out(1.4)).
2. **Espera**: o card fica parado enquanto a pessoa explica.
3. **Nota**: no instante em que a nota é dita, o card encolhe até o tamanho de miniatura (96 × 56 px) e voa pra próxima vaga livre da fileira certa (0,55 s, power3.inOut). As miniaturas ficam lado a lado na fileira, da esquerda pra direita, a partir de x = 66 dentro do quadro, com 8 px de espaço.
4. A fileira que recebeu o card pisca o rótulo (brilho 1 → 1,4 → 1 em 0,4 s).

No intervalo entre um item e outro, o quadro fica visível só com as miniaturas.

## Legendas

- Archivo 800 itálico, 54 px, caixa alta, branca, sombra `0 4px 14px rgba(0,0,0,0.7)`.
- De 2 a 4 palavras por bloco.
- Centralizada em x, centro em y = 935.
- Destaque: o nome do item, na primeira vez que é dito, e a nota ("NOTA F", "S TIER") aparecem em amarelo `#FFE14D`.

## Capa e gancho

No quadro 0: o quadro de tier list **completo** (com todas as miniaturas do fim do vídeo nas fileiras certas) e o tema no topo. É a capa que mostra o resultado. A partir do quadro 1, o quadro volta a ficar vazio e se preenche ao longo do vídeo.

## Chamada para ação

Se houver "comenta X": no fim, depois do último item, a legenda mostra "COMENTA X" com X em amarelo, e o quadro completo continua na tela até o END.

## Áudio

- Música: energética e divertida, 120–128 BPM, bateria eletrônica marcada e baixo saltado, estilo game show leve. ~−24 LUFS.
- Efeitos: "whoosh" curto na entrada de cada card, "plim" de duas notas quando o card pousa na fileira (S e A com notas mais agudas, E e F com notas mais graves), "buzzer" bem curto e baixo quando a nota é F. Riser curto terminando no fim do gancho.

## Saída

`edit/final.mp4`, 1080 × 1920, 60 fps, H.264 + AAC 48 kHz.

## Verificação do formato

- Cada card pousa na fileira da nota que a pessoa disse, no instante em que ela diz.
- Nenhum card ou miniatura cobrindo o rosto.
- Nomes dos itens legíveis (sem cortar letra) nos cards grandes.
- O quadro do quadro 0 bate com o quadro final.
- Tabela do ranking no relatório, com as interpretações de nota.
