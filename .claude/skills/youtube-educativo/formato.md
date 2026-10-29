# YouTube Educativo

Resumo: edição de vídeo longo pro YouTube (16:9) com três tipos de tela que se alternam: você em tela cheia com cards pequenos flutuando ao lado, tela dividida (explicação à esquerda, você à direita) e animações explicativas em tela cheia; tudo escuro com brilho laranja.

O visual descrito aqui (cores, fontes, materiais, legenda, música) é o **Original do formato**. Se a pessoa escolher outro estilo visual, o layout, as posições e o ritmo daqui continuam valendo e a aparência vem do estilo: siga `maquina-de-edicao/referencias/estilos-visuais.md`.

## Como fica

A maior parte do vídeo é a pessoa em tela cheia, como num vídeo normal de YouTube. Quando ela cita alguma coisa, um card pequeno aparece flutuando no canto esquerdo, ao lado dela, sem tirar o foco. Quando o assunto pede mais espaço, a tela se divide: a explicação ocupa o lado esquerdo e a pessoa fica no direito. Nos momentos mais didáticos (passos, comparação, processo), a tela inteira vira uma animação. Sem legenda queimada no vídeo: o YouTube cuida da legenda, e a skill entrega o arquivo `.srt`.

## Escolhas que este formato já define

Proporção (horizontal 16:9), nível (equivale ao Com imagens + animações do Kit Noite), legendas (sem legenda na tela; entrega `.srt`), visual original (cores, fontes e materiais, trocados se a pessoa escolher outro estilo visual), capa (sem título no vídeo; a thumbnail é à parte), verificação de fontes (ligada).

## Base técnica

- Vale: contato visual (bloco 3), produtos citados, fontes e verificação, representação de ações (interfaces reais).
- Seção "Formato horizontal 16:9" de `variacoes.md` vale pras proporções gerais, mas os layouts são os deste arquivo.
- Não vale: câmera virtual, desfoque de movimento, capa no quadro 0, cartão de chamada pra ação.
- Render a 60 fps direto (ou 30 fps se a gravação for 30 fps: siga o fps da gravação).

## Entradas extras

Nenhuma. Vídeos longos (10 a 40 min) são normais aqui: construa as composições em lotes por capítulo e, se houver subagentes, distribua os capítulos entre eles com a mesma direção visual.

## Ritmo e corte

- Regras de limpeza do motor, mais suaves: reduza pausas acima de 350 ms pra ~180 ms (vídeo longo cansa se ficar picotado).
- Mantenha respirações naturais entre parágrafos.
- **Capítulos**: identifique os assuntos do vídeo e anote em `edit/plano.md` (tempo de início e título curto). Eles viram os capítulos da descrição do YouTube no relatório.
- Proporção aproximada: 60% câmera cheia (com ou sem card), 25% dividido, 15% animação em tela cheia.

## Layouts

Tela de 1920 × 1080.

### A. Câmera cheia

Gravação em 1920 × 1080 (gravação vertical: ver "Formato horizontal 16:9" de `variacoes.md`, layout A). Sem zoom.

### A+card. Câmera cheia com card flutuante

Câmera cheia e, por cima, **um** card de vidro (Kit Noite) no lado oposto ao rosto:

- Tamanho entre 360 × 240 e 520 × 360 px.
- Posição: x = 60 a 120, y = 80 a 160 (se o rosto estiver à direita); espelhado se o rosto estiver à esquerda.
- Escurecimento local atrás do card: radial `rgba(0,0,0,0.35)` com 600 px de raio, pra o card ler sobre a imagem.
- Entra com subida de 30 px e fade em 0,4 s; sai com fade de 0,25 s quando a ideia muda.

### B. Dividido

- Esquerda (x = 0 a 960): tela gráfica no Kit Noite, com o brilho laranja no chão (elipse de 1400 × 500 centrada em (480, 1080)).
- Direita (x = 960 a 1920): a gravação, recortada pra 960 × 1080 com o rosto centralizado.
- Divisa reta.
- Conteúdo da esquerda entre x = 80 e x = 880, y = 140 e y = 940.

### C. Animação em tela cheia

Tela inteira no Kit Noite. Conteúdo entre x = 160 e x = 1760, y = 140 e y = 940.

### Regras de distribuição

- Abertura (primeiros 30–60 s): A, com no máximo 2 cards flutuantes. Nada de animação em tela cheia antes da pessoa se apresentar ou apresentar o assunto.
- Citação de produto, número, post, notícia → A+card (coisa pequena) ou B (coisa que precisa ser lida).
- Passos, comparação, processo, estrutura → C.
- Opinião, história, conversa com quem assiste → A.
- Nenhum trecho de B ou C passa de 25 s. Nenhum trecho de A sem card passa de 45 s sem que algo mude (card, corte ou layout).

## Direção visual

Kit Noite (`maquina-de-edicao/referencias/kit-noite.md`), sem textura de pontos, com fontes reduzidas pra 16:9 (títulos 56 px, texto de card 28–36 px, números 110–140 px).

## Gráficos

Do Kit Noite, adaptados:

- **Card de post/vídeo** (A+card): thumb com play, título, número de visualizações contando. Um check verde no canto quando a fala confirma resultado.
- **Contador de dias / grade** (A+card ou B): "Dia 19" → "Dia 30", grade 7 × 5 de quadrados laranja se preenchendo, gráfico de linha verde no rodapé.
- **Cards numerados em sequência** (C): até 3 cards grandes de vidro (380 × 460 px) lado a lado, número no canto superior esquerdo (Inter 700 40 px), mini visual no meio, título embaixo. O card citado fica ativo (fundo `rgba(204,116,48,0.18)` e borda laranja); os outros apagados.
- **Relação A → ? → B** (B): duas pílulas ligadas por uma linha, com uma pílula vermelha "?" no meio que vira a palavra certa (em Instrument Serif itálico laranja) quando a fala revela.
- **Interface real** (B ou C): a tela do produto citado, com a ação descrita.
- **Página de fonte** (B): captura real da notícia, como no bloco de fontes do motor, dentro do lado esquerdo.

## Legendas

Nenhuma legenda queimada no vídeo. Gere `edit/legendas.srt` a partir da faixa final de voz (depois dos cortes), com blocos de até 2 linhas de 42 caracteres e duração de 1 a 6 s.

## Capa e gancho

Sem capa no quadro 0. O vídeo começa direto na fala. (A thumbnail do YouTube é feita à parte.)

## Chamada para ação

Sem cartão. Se a pessoa pedir pra se inscrever ou comentar, mostre um card flutuante simples com o texto curto ("Inscreva-se", "Comenta X") por 3 s.

## Áudio

- Música: lo-fi eletrônico calmo, 80–95 BPM, **bem baixo**: ~−30 LUFS (6 LU abaixo do padrão do motor), pra não cansar em vídeo longo. Saída gradual de 3 s no fim. Pode ter trechos sem música (histórias, momentos sérios): marque em `edit/plano.md`.
- Efeitos: só os essenciais do Kit Noite ("tic" de card, "pop" de número, confirmação). Sem whoosh. Sem riser.
- Master a −14 LUFS como no motor.

## Saída

- `edit/final.mp4`, 1920 × 1080, fps da gravação (60 ou 30), H.264 + AAC 48 kHz.
- `edit/legendas.srt`.
- No relatório: lista de capítulos no formato da descrição do YouTube (`00:00 Título`).

## Verificação do formato

- Nenhum card flutuante sobre o rosto.
- Nenhuma animação em tela cheia nos primeiros 30 s.
- B e C sem passar de 25 s.
- `.srt` sincronizado com a faixa final (confira 5 pontos espalhados pelo vídeo).
- Capítulos começando em 00:00 e em ordem.
