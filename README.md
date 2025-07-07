# Projeto CI/CD com AWS, GitHub Actions e Terraform

Este projeto demonstra uma pipeline completa de CI/CD utilizando GitHub Actions, serviços AWS no Free Tier e Terraform para provisionamento de infraestrutura.

## 🔧 Tecnologias Utilizadas
- **AWS S3**: Hospedagem do front-end (HTML + JS)
- **AWS EC2**: Execução do back-end (Node.js + Express)
- **GitHub Actions**: CI/CD automatizado
- **Terraform**: Infraestrutura como código

## 📁 Estrutura do Projeto
```
📦 projeto/
 ┣ 📁 app/
 ┃ ┣ 📁 backend/
 ┃ ┃ ┗ app.js
 ┃ ┣ 📁 frontend/
 ┃ ┃ ┗ index.html
 ┃ ┗ 📁 .github/workflows/
 ┃   ┗ deploy.yml
 ┣ 📁 infra/
 ┃ ┣ main.tf
 ┃ ┣ variables.tf
 ┃ ┗ outputs.tf
```

## 🚀 Funcionalidades
- Deploy automático do front-end para o S3 ao fazer push na branch `main`
- Atualização do back-end em EC2 via SSH automatizado
- Provisionamento do bucket S3 com Terraform

## 🗂️ Como Executar

### 1. Configurar credenciais AWS
```bash
aws configure
```

### 2. Provisionar a infraestrutura
```bash
cd infra
terraform init
terraform apply
```

### 3. Subir código no GitHub e configurar Secrets
Adicione no repositório do GitHub os seguintes **Secrets**:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `EC2_HOST`
- `EC2_KEY` (chave privada no formato PEM, sem senha)

### 4. Fazer push na branch `main`
O GitHub Actions cuidará do deploy.

## 🧪 Exemplo de API
O backend expõe uma rota GET na raiz:
```
GET http://<ip-da-ec2>:3000/
Resposta: "API rodando!"
```

## 🌐 Exemplo de Front-end
```html
<h1>Deploy S3 funcionando!</h1>
```

## 📌 Observações
- A instância EC2 precisa ter o Node.js e PM2 instalados previamente
- O bucket S3 criado é público e serve arquivos estáticos como site

## ✅ Requisitos
- Conta AWS com plano gratuito
- GitHub
- Terraform instalado
- AWS CLI configurado com usuário IAM

## 🧠 Próximos passos
- Adicionar banco de dados (DynamoDB)
- Usar Docker + ECS em vez de EC2 puro
- Monitorar logs com CloudWatch

---

Feito para aprendizado e demonstração de CI/CD com ferramentas amplamente utilizadas no mercado. Contribuições são bem-vindas!
