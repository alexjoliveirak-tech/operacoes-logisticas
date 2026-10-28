# 🚚 Operações Logísticas: Do Banco de Dados ao Dashboard
 
Primeiro projeto de dados: construção de um banco relacional em **PostgreSQL** para uma operação de transporte e logística, análises em **SQL** e dashboard em **Power BI** para acompanhar os principais indicadores da operação.
 
## 📌 Objetivo
 
Construir, do zero, a estrutura de dados de uma transportadora (clientes, frota, rotas, cargas e viagens) e transformá-la em informação visual e analítica para apoiar decisões.
 
## 🔄 Etapas do projeto
 
1. **Modelagem:** definição das entidades, chaves primárias, chaves estrangeiras e restrições
2. **Criação do banco:** script SQL em PostgreSQL
3. **Carga de dados:** população das tabelas
4. **Análises em SQL:** consultas sobre receita, motoristas, rotas e manutenção
5. **Dashboard:** conexão do PostgreSQL com o Power BI e construção das visualizações
## 📊 Dashboard
 
<p align="center">
  <img src="imagens/dash_imagem.png" alt="Dashboard Power BI - Operações Logísticas: Receita e Clientes" width="900">
</p>
O dashboard apresenta os principais indicadores da operação:
 
- **KPIs:** receita total, peso total transportado e total de cargas
- **Receita por cliente:** gráfico de barras e tabela com os maiores clientes
- **Cargas por tipo:** distribuição entre Refrigerated e Dry Van
- **Receita por mês:** evolução da receita ao longo do ano
## 🗂️ Estrutura do Banco
 
O banco é composto por 9 tabelas:
 
| Tabela | Descrição |
|---|---|
| `customers` | Clientes que contratam o transporte |
| `drivers` | Motoristas |
| `trucks` | Caminhões da frota |
| `trailers` | Reboques (dry van e refrigerados) |
| `facilities` | Terminais, depósitos e centros de distribuição |
| `routes` | Rotas com distância, tarifa por milha e prazo típico |
| `loads` | Cargas contratadas (cliente, rota, receita e encargos) |
| `trips` | Viagens executadas (carga, motorista, caminhão e trailer) |
| `maintenance_records` | Histórico de manutenção dos caminhões |
 
## 🔗 Relacionamentos
 
- `loads` pertence a um `customer` e a uma `route`
- `trips` executa uma `load` e referencia `driver`, `truck` e `trailer`
- `maintenance_records` está ligada a um `truck`
## 🔍 Análises em SQL
 
O arquivo `analises.sql` reúne consultas que respondem perguntas de negócio, usando `JOIN`, agregações, CTEs e window functions:
 
- Receita por cliente e ranking com participação acumulada
- Desempenho por motorista (viagens, milhas, consumo, tempo ocioso e receita gerada)
- Custo de manutenção por caminhão e por tipo de serviço
- Evolução mensal da receita com variação em relação ao mês anterior
- Receita por rota e por milha
- Rentabilidade por caminhão (receita gerada menos custo de manutenção)
## 🛠️ Tecnologias
 
- PostgreSQL
- SQL (DDL, JOINs, agregações, CTEs, window functions)
- Power BI
## 📁 Arquivos
 
- `Projeto.sql`: criação das tabelas, chaves e restrições
- `analises.sql`: consultas analíticas
- `imagens/`: prints do dashboard
## 📚 Fonte dos dados
 
[Preencher: link do dataset público, ou "Dados fictícios gerados para fins de estudo"]
 
## 🚀 Próximos passos
 
- Publicar o dashboard online e incluir o link
- Adicionar novas análises (sazonalidade, eficiência de combustível)
- Relacionar `facilities` ao restante do modelo
 
