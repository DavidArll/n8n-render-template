FROM node:18-bullseye

# Crear usuario para n8n
RUN useradd --user-group --create-home --shell /bin/false n8n

# Instalar dependencias (FFmpeg, Python, compiladores)
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential

# Crear carpeta de trabajo
WORKDIR /home/n8n

# Instalar n8n y nodos válidos adicionales
RUN npm install -g n8n
RUN npm install -g nodes-openai

# Cambiar al usuario no-root
USER n8n

# Exponer el puerto de n8n
EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
