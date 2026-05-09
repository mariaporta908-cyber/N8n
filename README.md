# 🚀 N8N no Render — Deploy via GitHub

Deploy do **n8n** (automação de workflows) no **Render.com** usando Docker, com banco de dados PostgreSQL gerenciado.

---

## 📁 Estrutura do Projeto

```
n8n-render/
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD com GitHub Actions
├── Dockerfile                # Imagem Docker do n8n
├── docker-compose.yml        # Para rodar localmente
├── render.yaml               # Configuração do Render (Blueprint)
├── .env.example              # Modelo de variáveis de ambiente
├── .gitignore                # Arquivos ignorados pelo Git
└── README.md                 # Este arquivo
```

---

## ⚡ Deploy Rápido no Render

### Passo 1 — Subir para o GitHub

```bash
git init
git add .
git commit -m "feat: n8n no Render"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/SEU_REPO.git
git push -u origin main
```

### Passo 2 — Conectar ao Render

1. Acesse [render.com](https://render.com) e faça login
2. Clique em **New +** → **Blueprint**
3. Conecte seu repositório GitHub
4. O Render vai ler o `render.yaml` e criar automaticamente:
   - ✅ Serviço Web com n8n
   - ✅ Banco de dados PostgreSQL

### Passo 3 — Configurar variáveis secretas

No painel do Render, vá em **Environment** e adicione:

| Variável | Descrição |
|---|---|
| `N8N_BASIC_AUTH_USER` | Usuário de login do n8n |
| `N8N_BASIC_AUTH_PASSWORD` | Senha de login do n8n |
| `WEBHOOK_URL` | URL do seu serviço (ex: `https://n8n.onrender.com/`) |

> ⚠️ As variáveis `N8N_ENCRYPTION_KEY` e `N8N_USER_MANAGEMENT_JWT_SECRET` são geradas automaticamente pelo Render.

### Passo 4 — Acessar o n8n

Após o deploy (≈ 3–5 min), acesse a URL do serviço no Render e faça login com as credenciais definidas.

---

## 💻 Rodar Localmente

### Pré-requisitos
- Docker e Docker Compose instalados

### Configurar variáveis

```bash
cp .env.example .env
# Edite o .env com seus valores
nano .env
```

### Iniciar

```bash
docker-compose up -d
```

Acesse: **http://localhost:5678**

### Parar

```bash
docker-compose down
```

---

## 🔐 Variáveis de Ambiente

Todas as variáveis estão documentadas no arquivo `.env.example`.

### Gerar chaves seguras

```bash
# N8N_ENCRYPTION_KEY
openssl rand -hex 32

# N8N_USER_MANAGEMENT_JWT_SECRET
openssl rand -base64 32
```

---

## 📊 Planos do Render

| Recurso | Free | Starter |
|---|---|---|
| RAM | 512 MB | 512 MB |
| CPU | Compartilhado | Compartilhado |
| Sleep após inatividade | ✅ Sim (15min) | ❌ Não |
| Banco PostgreSQL | 90 dias | Permanente |
| Preço | Grátis | ~$7/mês |

> 💡 **Recomendado:** Use o plano **Starter** para evitar que o serviço durma e perder o banco após 90 dias.

---

## 🔄 Deploy Automático

Cada `push` na branch `main` dispara automaticamente um novo deploy no Render.

```bash
git add .
git commit -m "update: nova configuração"
git push origin main
# ↑ Render faz o deploy automaticamente!
```

---

## 🆘 Problemas Comuns

### n8n não inicia
- Verifique se as variáveis de banco estão corretas no painel do Render
- Confirme que o banco de dados PostgreSQL está ativo

### Webhook não funciona
- Atualize `WEBHOOK_URL` com a URL exata do seu serviço no Render
- Inclua a barra no final: `https://seu-servico.onrender.com/`

### Credenciais perdidas após redeploy
- Verifique se `N8N_ENCRYPTION_KEY` está fixada — nunca mude esta chave!

---

## 📚 Recursos Úteis

- [Documentação do n8n](https://docs.n8n.io)
- [Render Docs](https://render.com/docs)
- [n8n no Docker Hub](https://hub.docker.com/r/n8nio/n8n)
- [Blueprint Spec do Render](https://render.com/docs/blueprint-spec)
