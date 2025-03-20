# 📌 Análise de Golpes Financeiros com DBT  

## 📖 Visão Geral  
Este projeto visa analisar dados de golpes financeiros coletados via Google Sheets, transformando-os em insights valiosos por meio do **DBT (Data Build Tool)**. Os dados são extraídos, carregados em um **PostgreSQL** e transformados para facilitar a análise.  

---

## 🏗️ Arquitetura  

1. **Extração (ETL)**  
   - Os dados são coletados de uma planilha do Google Sheets usando a API do Google.  
   - O script Python carrega os dados na tabela `bronze_golpes_financeiros`.  

2. **Transformação (DBT)**  
   - A camada **Silver** estrutura e normaliza os dados para facilitar a análise.  
   - A camada **Gold** gera métricas para análise estratégica.  

3. **Armazenamento e Acesso**  
   - Banco de dados **PostgreSQL**.  
   - Consultas estruturadas via DBT para insights analíticos.  

---

## 📊 Modelos DBT  

### **1️⃣ Bronze Layer (`bronze_golpes_financeiros`)**  
- **Armazena os dados crus extraídos da planilha**.  
- Os nomes das colunas são normalizados para evitar problemas com espaços e caracteres especiais.  

### **2️⃣ Silver Layer (`silver_golpes_financeiros`)**  
- **Transforma e padroniza os dados**, ajustando colunas e formatos.  
- Remove inconsistências como espaços extras nos nomes das colunas.  

### **3️⃣ Gold Layer (`silver_metricas`)**  
- **Gera KPIs para análise dos golpes financeiros**, incluindo:  
  - Percentual de vítimas.  
  - Golpe mais comum.  
  - Percentual de denúncias.  
  - Interesse em cursos sobre segurança financeira.  

---

## ⚙️ Como Executar  

1️⃣ **Rodar a extração e carga de dados:**  
python extract_load.py

2️⃣ **Executar os modelos DBT:**  
dbt run

3️⃣ **Gerar a documentação interativa:**  
dbt docs generate
dbt docs serve

---

## 📈 Principais KPIs

- **perc_vitima_golpe** → Percentual de respondentes que já foram vítimas.
- **golpe_mais_comum** → Tipo de golpe mais frequente.
- **perc_denuncia_golpe** → Quantidade de pessoas que denunciaram.
- **perc_interesse_curso** → Percentual de pessoas interessadas em cursos sobre golpes financeiros.

---

## 🛠️ Tecnologias Utilizadas

- **Python** → Extração e carga de dados.
- **Google Sheets API** → Fonte de dados.
- **PostgreSQL** → Armazenamento.
- **DBT** → Transformação de dados e geração de métricas.