# Importa as classes Livro e Estoque de arquivos externos
require_relative "Livro"
require_relative "Estoque"

# Criação de instâncias da classe Livro
algoritmos = Livro.new("Algoritmos", 100, 1998, true, "editora", "livro")
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, "editora", "livro")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "editora", "livro")
ruby = Livro.new("Programming Ruby", 100, 2004, true, "editora", "livro")
revistona = Livro.new("Revista de Ruby", 10, 2012, true, "Revistas", "revista")
online_arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 50, 2012, true, "editora", "ebook")

# Criação de uma instância da classe Estoque
estoque = Estoque.new

# Adiciona os objetos à instância do Estoque utilizando o operador <<
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby << revistona << revistona << online_arquitetura

# Realiza vendas de alguns itens do estoque
estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
estoque.vende online_arquitetura

# Imprime o título do item mais vendido por categoria
puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo

# Verifica se o estoque responde ao método :ebook_que_mais_vendeu_por_titulo
puts estoque.respond_to?(:ebook_que_mais_vendeu_por_titulo)
