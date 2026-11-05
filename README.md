# Máquina de Edição com IA Básico

## 🚀 Acesse a versão completa

Amplie sua Máquina de Edição com **mais dez formatos de edição**.

### [👉 QUERO A VERSÃO COMPLETA](https://pay.hub.la/0Nq9Z4tSkclRESReVpkw)

O complemento adiciona Reels com B-roll, Ensaio Visual, Nuvem de Imagens, Recorte com Imagens, Aula em Tela Dividida, Palavra Atrás da Cabeça, Checklist na Tela, Marcações, Capa de Revista e Grade do Perfil.

---

Inclui a Máquina de Edição e dez formatos, cada um com sua própria skill:

| Comando | Como fica |
|---|---|
| `/reels-de-negocio` | Alterna câmera cheia, tela dividida e animação em tela cheia |
| `/tela-dividida-explicativa` | Você embaixo e explicações animadas em cima |
| `/legenda-encaixada` | Tipografia animada, com uma palavra gigante e a frase encaixada ao redor |
| `/telas-em-profundidade` | Interfaces animadas atrás de você, com profundidade |
| `/cortes-de-video-longo` | Seleção e edição de cortes verticais de um vídeo longo |
| `/youtube-educativo` | Vídeo horizontal com cards, tela dividida e animações explicativas |
| `/formato-ranking` | Tier list animada que se preenche conforme as avaliações |
| `/zoom-na-palavra` | Aproximação rápida nas palavras fortes e mira travando no seu rosto |
| `/widgets-de-vidro` | Widgets de vidro em volta da cabeça e gráficos de vidro subindo |
| `/cards-em-orbita` | Seus posts girando em volta da cabeça, em carrossel 3D ou em leque |

O pacote inclui formatos verticais para Reels, TikTok e Shorts, cortes de vídeos longos e edição horizontal para YouTube. O caminho **Do zero** também permite editar nas duas orientações. Pixelado, Noite Laranja e Claro Tecnológico vêm incluídos e podem ser combinados com qualquer formato.

## Instalar

### Pré-requisitos

Antes de rodar o instalador, tenha no computador:

- **Git** (no Windows: `winget install Git.Git`; no Mac: `xcode-select --install`)
- **Python 3.10 ou mais novo** (no Windows: `winget install Python.Python.3.12`; no Mac: `brew install python`)
- **FFmpeg** (no Windows: `winget install Gyan.FFmpeg`; no Mac: `brew install ffmpeg`)

O instalador confere o Git e o Python e para com a instrução de instalação se faltar algum.

Extraia o ZIP inteiro, incluindo a pasta `.claude`, e abra um terminal nesta pasta.

Windows (PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -File .\instalar.ps1
```

Mac/Linux:

```bash
bash instalar.sh
```

O instalador copia onze skills para `~/.claude/skills/` (o motor e os dez formatos) e instala o [earshot](https://github.com/Leonxlnx/earshot), que a Máquina usa em todos os efeitos sonoros. O earshot fica em `~/.maquina-de-edicao/earshot`, com ambiente Python próprio, e vem com a skill `/earshot`. Na primeira instalação ele baixa cerca de 1,5 GB (PyTorch e os modelos de escuta), então pode levar alguns minutos. Se houver versões antigas das mesmas skills, elas ficam em `~/.claude/skills-backup/`. Preferências, estilos pessoais e outros formatos já instalados são preservados.

Feche e abra o Claude Code depois da instalação.

## Editar

Crie uma pasta própria para cada vídeo, fora desta pasta de instalação, e coloque a gravação nela. Abra o Claude Code nessa pasta e digite `/maquina-de-edicao` ou o comando de um formato. É necessário acesso ao Claude Code.

Na primeira edição, o Claude confere Node.js, FFmpeg, Python, HyperFrames e o earshot e orienta a instalação do que faltar. Um painel local abre no navegador para você escolher o formato e o visual. Depois da montagem, assista no HyperFrames Studio e peça ajustes. Para gerar o MP4 final, diga **pode exportar**. A saída fica em `edit/final.mp4`.

## Atualizar e adicionar formatos

Baixe a nova versão do seu pacote, extraia e rode o instalador novamente. Quem comprou o complemento instala o ZIP de dez formatos extras depois do principal; os novos comandos aparecem no mesmo painel.

## Baixar pelo GitHub

```bash
git clone https://github.com/matheusfonseca-ia/maquina-de-edicao-com-ia-basico.git
cd maquina-de-edicao-com-ia-basico
```

Depois execute o instalador do seu sistema conforme as instruções acima. Para atualizar a cópia clonada, rode `git pull` e execute o instalador novamente.

### Efeitos sonoros com o earshot

Todos os efeitos sonoros (cliques, impactos, confirmações, passagens e o som crescente da abertura) saem do banco de sons do earshot, em todos os formatos e estilos. A Máquina monta o kit de efeitos do vídeo, posiciona cada som no quadro do evento e confere pela escuta do earshot se cada efeito caiu no tempo certo. A música continua sendo criada por código.

### Efeitos de vídeo

Zoom na Palavra, Widgets de Vidro e Cards em Órbita (e cinco formatos do complemento) aplicam efeitos direto na sua gravação: recortam você, seguem o seu rosto e colocam widgets, cards e palavras atrás ou em volta da sua cabeça. Esses efeitos são do [claude-video-effects](https://github.com/Vibha-Ramprakash/claude-video-effects), de Vibha Ramprakash, usados com o código original, só com os rótulos da interface traduzidos pro português (licença MIT, em `.claude/skills/maquina-de-edicao/efeitos/LICENSE`). O instalador cria um ambiente Python próprio pra eles em `~/.maquina-de-edicao/efeitos` (OpenCV, MediaPipe e Pillow, cerca de 350 MB). Esses formatos saem a 30 quadros por segundo na câmera.

### Enquadramento em todos os vídeos

A Máquina mantém o centro da cabeça da pessoa exatamente no centro horizontal da imagem ou da janela da câmera, em todos os formatos e estilos. Ajusta o enquadramento por tomada e durante movimentos, e verifica a centralização antes da revisão e na exportação final. Essa configuração é automática e também vale ao reutilizar preferências antigas.
