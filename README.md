# 🚚 Operações Logísticas — Banco de Dados

Modelagem de banco de dados relacional em **PostgreSQL** para gestão de uma operação de transporte e logística, simulando o controle de clientes, frota, rotas e viagens de uma empresa do setor.

## 📌 Objetivo

Praticar modelagem relacional aplicada a um cenário real de logística, estruturando entidades e relacionamentos com uso de chaves primárias, chaves estrangeiras e integridade referencial.

## 🗂️ Estrutura do Banco

O banco `operacoes_logisticas` é composto por 9 tabelas:

| Tabela | Descrição |
|---|---|
| `clientes` | Empresas ou pessoas que contratam o transporte de cargas |
| `motoristas` | Condutores responsáveis pelas viagens |
| `caminhoes` | Veículos utilizados para o transporte |
| `trailers` | Reboques/carretas vinculados aos caminhões |
| `instalacoes` | Pontos físicos como depósitos, filiais ou centros de distribuição |
| `rotas` | Trajetos entre origem e destino |
| `cargas` | Itens transportados em cada viagem |
| `viagens` | Registros de deslocamento, associando motorista, caminhão, rota e carga |
| `manutencao` | Histórico de manutenções realizadas na frota |

## 🔗 Relacionamentos

As tabelas estão conectadas por chaves estrangeiras, garantindo integridade referencial. Por exemplo:
- Uma **viagem** referencia um `motorista`, um `caminhão`, uma `rota` e uma `carga`
- Uma **carga** está associada a um `cliente`
- A **manutenção** está vinculada a um `caminhão` ou `trailer`

## 🛠️ Tecnologias

- PostgreSQL
- SQL (DDL para criação das tabelas, chaves e restrições)

## 📁 Arquivos

- `Projeto.sql` — script completo de criação do banco de dados (tabelas, chaves primárias, chaves estrangeiras e restrições de integridade)

## 🚀 Próximos passos

- Popular o banco com dados de exemplo
- Criar consultas SQL de análise (receita por cliente, produtividade por motorista, etc.)
- Conectar ao Power BI para construção de dashboards
