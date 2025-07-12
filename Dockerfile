FROM node:18-bullseye

# Crear usuario no-root
RUN useradd --user-group --create-home --shell /bin/false n8n

# Instalar dependencias (FFmpeg, Python, GCC)
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential

# Crear carpeta de trabajo
WORKDIR /home/n8n

# Instalar n8n y nodos community disponibles desde NPM
RUN npm install -g n8n \
  @n8n/nodes-openai \
  @n8n/nodes-google \
  @n8n/nodes-http-request-plus \
  @n8n/nodes-dropbox

# Cambiar al usuario seguro
USER n8n

# Exponer el puerto por defecto
EXPOSE 5678

# Comando de inicio
CMD ["n8n"]
