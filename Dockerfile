# Imagen base con apt-get y node
FROM node:18-bullseye

# Crear usuario para n8n
RUN useradd --user-group --create-home --shell /bin/false n8n

# Instalar dependencias
RUN apt-get update && apt-get install -y ffmpeg python3 build-essential

# Crear carpeta de trabajo
WORKDIR /home/n8n

# Instalar n8n globalmente
RUN npm install n8n -g

# Cambiar al usuario n8n
USER n8n

# Expone el puerto por defecto
EXPOSE 5678

# Comando para iniciar n8n
CMD ["n8n"]
