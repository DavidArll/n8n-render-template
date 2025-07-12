FROM node:18-bullseye

# Crear usuario
RUN useradd --user-group --create-home --shell /bin/false n8n

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential

# Carpeta de trabajo
WORKDIR /home/n8n

# Instalar n8n + nodos adicionales válidos
RUN npm install -g n8n \
  @n8n/nodes-openai \
  @n8n/nodes-http-request-plus

# Cambiar a usuario sin privilegios
USER n8n

# Exponer puerto de n8n
EXPOSE 5678

# Ejecutar n8n
CMD ["n8n"]
