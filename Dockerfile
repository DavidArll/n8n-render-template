FROM node:18-bullseye

# Crear usuario no-root
RUN useradd --user-group --create-home --shell /bin/false n8n

# Instalar dependencias (ffmpeg, python, gcc)
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential

# Directorio de trabajo
WORKDIR /home/n8n

# Instalar n8n y nodos community válidos
RUN npm install -g n8n \
  @n8n/nodes-openai \
  @n8n/nodes-google \
  @n8n/nodes-telegram \
  @n8n/nodes-discord \
  @n8n/nodes-slack \
  @n8n/nodes-http-request-plus \
  @n8n/nodes-dropbox

# ⚠️ Nodos desde GitHub (ejemplo WAHA WhatsApp)
RUN npm install -g https://github.com/ElGatoAI/n8n-nodes-waha.git

# Cambiar a usuario seguro
USER n8n

# Exponer puerto por defecto
EXPOSE 5678

# Comando de inicio
CMD ["n8n"]
