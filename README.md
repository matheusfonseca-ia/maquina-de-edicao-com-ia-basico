# Máquina de Edição com IA Básico

## 🚀 Acesse a versão completa

Amplie sua Máquina de Edição com **mais seis formatos de edição**.

### [👉 QUERO A VERSÃO COMPLETA](https://pay.hub.la/0Nq9Z4tSkclRESReVpkw)

O complemento adiciona Reels com B-roll, Ensaio Visual, Nuvem de Imagens, Recorte com Imagens, Formato Ranking e Aula em Tela Dividida.

---

Inclui a Máquina de Edição e seis formatos, cada um com sua própria skill:

| Comando | Como fica |
|---|---|
| `/reels-de-negocio` | Alterna câmera cheia, tela dividida e animação em tela cheia |
| `/tela-dividida-explicativa` | Você embaixo e explicações animadas em cima |
| `/legenda-encaixada` | Tipografia animada, com uma palavra gigante e a frase encaixada ao redor |
| `/telas-em-profundidade` | Interfaces animadas atrás de você, com profundidade |
| `/cortes-de-video-longo` | Seleção e edição de cortes verticais de um vídeo longo |
| `/youtube-educativo` | Vídeo horizontal com cards, tela dividida e animações explicativas |

O pacote inclui formatos verticais para Reels, TikTok e Shorts, cortes de vídeos longos e edição horizontal para YouTube. O caminho **Do zero** também permite editar nas duas orientações. Pixelado, Noite Laranja e Claro Tecnológico vêm incluídos e podem ser combinados com qualquer formato.

## Instalar

Extraia o ZIP inteiro, incluindo a pasta `.claude`, e abra um terminal nesta pasta.

Windows (PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -File .\instalar.ps1
```

Mac/Linux:

```bash
bash instalar.sh
```

O instalador copia sete skills para `~/.claude/skills/` (o motor e os seis formatos). Se houver versões antigas das mesmas skills, elas ficam em `~/.claude/skills-backup/`. Preferências, estilos pessoais e outros formatos já instalados são preservados.

Feche e abra o Claude Code depois da instalação.

## Editar

Crie uma pasta própria para cada vídeo, fora desta pasta de instalação, e coloque a gravação nela. Abra o Claude Code nessa pasta e digite `/maquina-de-edicao` ou o comando de um formato. É necessário acesso ao Claude Code.

Na primeira edição, o Claude confere Node.js, FFmpeg, Python e HyperFrames e orienta a instalação do que faltar. Um painel local abre no navegador para você escolher o formato e o visual. Depois da montagem, assista no HyperFrames Studio e peça ajustes. Para gerar o MP4 final, diga **pode exportar**. A saída fica em `edit/final.mp4`.

## Atualizar e adicionar formatos

Baixe a nova versão do seu pacote, extraia e rode o instalador novamente. Quem comprou o complemento instala o ZIP de seis formatos extras depois do principal; os novos comandos aparecem no mesmo painel.

## Baixar pelo GitHub

```bash
git clone https://github.com/matheusfonseca-ia/maquina-de-edicao-com-ia-basico.git
cd maquina-de-edicao-com-ia-basico
```

Depois execute o instalador do seu sistema conforme as instruções acima. Para atualizar a cópia clonada, rode `git pull` e execute o instalador novamente.

### Enquadramento em todos os vídeos

A Máquina mantém o centro da cabeça da pessoa exatamente no centro horizontal da imagem ou da janela da câmera, em todos os formatos e estilos. Ajusta o enquadramento por tomada e durante movimentos, e verifica a centralização antes da revisão e na exportação final. Essa configuração é automática e também vale ao reutilizar preferências antigas.
