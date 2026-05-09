# N8N Deploy Template

Este projeto já está pronto para subir no GitHub e hospedar no Render.

## Passos

1. Cria um repositório no GitHub
2. Envia todos os arquivos desta pasta
3. Vai no Render
4. Clica em "New +" > "Web Service"
5. Conecta o GitHub
6. Seleciona este repositório
7. O Render vai detectar automaticamente o Dockerfile

## Variáveis de ambiente recomendadas

No Render adiciona:

- N8N_HOST
- N8N_PROTOCOL=https
- WEBHOOK_URL
- GENERIC_TIMEZONE=Africa/Luanda

## Login padrão

Cria no Render:

- N8N_BASIC_AUTH_ACTIVE=true
- N8N_BASIC_AUTH_USER=admin
- N8N_BASIC_AUTH_PASSWORD=sua_senha

## Porta

O Render usa automaticamente a variável PORT.
