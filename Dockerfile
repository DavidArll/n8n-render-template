FROM node:18-bullseye

# Crear usuario para n8n
RUN useradd --user-group --create-home --shell /bin/false n8n

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential

# Crear carpeta de trabajo
WORKDIR /home/n8n

# Instalar n8n + nodos community válidos
RUN npm install -g n8n \
  @n8n/nodes-openai \
  @n8n/nodes-google \
  @n8n/nodes-http-request-plus

# Cambiar a usuario sin privilegios
USER n8n

# Exponer el puerto de n8n
EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
