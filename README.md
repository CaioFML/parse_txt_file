
# Importador de vendas

## Setup

Siga os passos a seguir para rodar esta aplicação:

- Rode o build da imagem do docker:

    `docker-compose build`

- Suba o servidor, isso também irá criar e rodar as migrations do banco de dados:

    `docker-compose up`

- Acesse pelo browser:

    `localhost:3000`
    
## Rodando os testes

- Rode o comando abaixo para executar os testes:

    `docker-compose run --rm app bundle exec rspec`

## Rodando o rubocop:

- Esta aplicação foi feita utilizando o [rubocop](https://github.com/rubocop-hq/rubocop), uma gem que força a utilização dos estilos propostos em [RubyStyle Guide](https://rubystyle.guide/)
    
    `docker-compose run --rm app bundle exec rubocop`
    
## Referências

- Foi utilizado o [betterspec](https://www.betterspecs.org/) como referência de boas práticas na criação dos testes.