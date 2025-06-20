#!/bin/bash
apt-get update -y
apt-get install -y docker.io docker-compose
systemctl enable docker
systemctl start docker

mkdir -p /opt/backend
cd /opt/backend

cat <<EOL > docker-compose.yml
version: '3'
services:
  app:
    image: your-backend-image:latest
    ports:
      - "3000:3000"
    environment:
      - DB_HOST=${DB_HOST}
      - DB_USER=${DB_USER}
      - DB_PASS=${DB_PASS}
      - DB_NAME=${DB_NAME}
EOL

docker-compose up -d
