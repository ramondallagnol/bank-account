# Bank Accounting

O sistema Bank Accounting é uma API Open-Source. Criada com a finalidade de gerenciar contas bancárias de clientes.


## Requisitos não funcionais

 1. O sistema deve expor uma API via HTTP
 2. A API deve possuir algum mecanismo de autenticação para identificar o cliente que está fazendo as requisições
 3. Os dados devem ser armazenados em um banco PostgreSQL
 4. Você deve usar Ruby ou Elixir para implementar este projeto
 5. O código deve ser versionado usando git
 6. O repositório deve conter um README documentando como o sistema pode ser usado e como outra pessoa pode contribuir com o código, similar a um projeto Open Source

## Fluxos implementados
 - Transações bancárias
 - Consulta de saldo da conta

#  Summary

Foi utilizado Ruby on Rails para implementação do desafio. A api possui 4 models, sendo eles: `Bank`, `Client`, `Account` e `Transaction`.

Para realização da API, foi utilizado o padrão de projeto SOLID.

## Init Database

Foi utilizado o banco de dados PostgreSQL para desenvolvimento da API
First, update apt-get:

    sudo apt-get update
   
Para instalar o banco de dados, visite a página de downloads do site oficial https://www.postgresql.org/download/ e faça o download do mesmo:


##  Passo a passo para instalaçao da aplicação

Instale as gems do projeto com o comando abaixo:

    bundle install

Rode o comando abaixo para criar as bases de dados para a aplicação - `development`  e  `test`:

    rails db:create

Execute o Migrate para criação das tabelas no banco de dados:

    rails db:migrate

Execute o comando abaixo para popular o banco

    rails db:seed
   
Run App:

    rails s

Visualizar todas as rotas disponíveis

    rails routes
    
Executar os testes:

    rspec
    
# Ajude a melhorar essa API, faça um pull request :blush:

Por que ajudar? 
Contribuir com um projeto Open Source pode aumentar exponencialmente o seu conhecimento por te expor a um projeto maduro e que foi feito por vários desenvolvedores experientes. Todo esse esforço certamente vai se transformar em conhecimento.

### Como contribuir?

#### Veja como é fácil

1. Crie uma conta no GitHub (caso você ainda não tenha)
2. Crie um Fork do Projeto
3. Faça o Clone do seu Projeto
4. Sincronize o seu Fork com o projeto original (Opcional)
5. Crie uma Branch
6. Realize a mudança  e faça o commit
7. Suba a sua Branch
8. Faça a Pull Request
