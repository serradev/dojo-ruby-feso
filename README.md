# README

Apresentação de Workshop de Ruby on Rails Serra Dev

Pauta:

* Conceitos básicos de Ruby

* Conceitos básicos do Rails

* Criação de um projeto

* Criação de migrations e models

* CRUD

* Criação de controllers

* Conceitos básicos de REST

* ERB

* Utilização de geradores (scaffold)

* Adicionando relacionamentos 

## Instalação do ruby

Base:

```
sudo apt-get install gawk autoconf automake bison libffi-dev libgdbm-dev  \
                libncurses5-dev libsqlite3-dev build-essential  nodejs \ 
                     libtool libyaml-dev sqlite3 libgmp-dev libssl-dev
```

Via APT-GET

`sudo apt-get install ruby`


Via Gerenciador de versões

 * [RVM](https://rvm.io/)
 * [RBENV](https://github.com/rbenv/rbenv)
 * [ASDF](https://asdf-vm.com/) - [ASDF-RUBY](https://github.com/asdf-vm/asdf-ruby)

## Instalação do Rails

Abra um terminal, navegue até a pasta onde ficará seu projeto:
```
$ cd ~/path/do/projeto

$ gem install rails

$ rails new blog

$ cd blog/

```

## Criando primeira Migration e Model (Category)

Execute o seguinte comando para criar a migration:

    $ rails generate migration CreateCategory

Adicione o campo nome na migration que foi gerada (201908XXXXXXX_create_categories.rb), para que a mesma fique no seguinte formato:

```ruby
class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
```

Execute de fato a migration no banco de dados:

  `$ rails db:migrate`

## Inserir validação de presence e unique

Crie a migration que irá realizar a criação das validações no banco de dados:

  `$ rails generate migration AddConstraintsCategory`

Altere a migration (2019XXXXXXXX_add_constraints_category.rb) para inserir as validações:

```ruby
class AddConstraintsCategory < ActiveRecord::Migration[6.0]
  def change
    change_column_null :categories, :name, false
    add_index :categories, :name, unique: true
  end
end
```

Execute as migrations pelo terminal:

`$ rails db:migrate`

Adicione as validações na model category.rb:

```ruby
class Category < ApplicationRecord

  validates :name, presence: true, uniqueness: true

end
```



## Criação de Controller

Para criar uma controller Welcome, com um método "index", execute o seguinte comando:

  `$ rails generate controller Welcome index`

Adicione a rota no arquivo routes.rb:

```ruby
Rails.application.routes.draw do
  root 'welcome#index'
end
```

Crie o arquivo referente a view (app/views/welcome/index.html.erb):

```erb
<p> Welcome! </p>
```

## Criação da entidade artigos, usando scaffold

Para criar a entidade "Article" usando scaffold, execute:

`$ rails generate scaffold Article title:string content:text`

## Adicionando relacionamento entre entidades

Crie a migration para adicionar a chave estrangeira (FK) no banco de dados:

`$ rails generate migration AddCategoryToArticle`

Altere a migration gerada para conter o mapeamento:

```ruby
class AddCategoryToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :category, foreign_key: true, index: true
  end
end
```

Rode a migration no banco de dados:

`rails db:migrate`

Adicione o relacionamento na model article.rb :

```ruby
class Article < ApplicationRecord

  belongs_to :category

end
```

Adicione o relacionamento na model category.rb :

```ruby
class Category < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :articles

end
```

## Ajustes finais

Confira os últimos commits do proj https://github.com/mendesds/serradev/commit/463333b8d12ee92cbb3728c1af3523d69de438af para verificar os últimos ajustes no template da aplicação, no qual são adicionados o seletor de categoria no cadastro de artigos.














