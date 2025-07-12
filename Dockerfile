# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

RUN apt-get update && apt-get install -y ffmpeg

# Expone el puerto que n8n usa
EXPOSE 5678
