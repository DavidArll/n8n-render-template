# Imagen base con apt-get y node
FROM node:18-bullseye

# Crear usuario para n8n
RUN useradd --user-group --create-home --shell /bin/false n8n

# Instalar dependencias
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential

# Crear carpeta de trabajo
WORKDIR /home/n8n

# Instalar n8n globalmente
# Instalación masiva de nodos
RUN npm install -g \
  @n8n/nodes-google \
  @n8n/nodes-openai \
  @n8n/nodes-anthropic \
  @n8n/nodes-perplexity \
  @n8n/nodes-mistral \
  @n8n/nodes-deepseek \
  @n8n/nodes-telegram \
  @n8n/nodes-discord \
  @n8n/nodes-slack \
  @n8n/nodes-twitter \
  @n8n/nodes-facebook \
  @n8n/nodes-instagram \
  @n8n/nodes-whatsapp \
  @n8n/nodes-airtable \
  @n8n/nodes-notion \
  @n8n/nodes-microsoft \
  @n8n/nodes-dropbox \
  @n8n/nodes-figma \
  @n8n/nodes-github \
  @n8n/nodes-gitlab \
  @n8n/nodes-box \
  @n8n/nodes-jira \
  @n8n/nodes-http-request-plus \
  @n8n/nodes-apify \
  @n8n/nodes-serpapi \
  @n8n/nodes-puppeteer \
  @n8n/nodes-ffmpeg \
  @n8n/nodes-replicate \
  n8n-nodes-base
# Cambiar al usuario n8n
USER n8n

# Expone el puerto por defecto
EXPOSE 5678

# Comando para iniciar n8n
CMD ["n8n"]
