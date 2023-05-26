# Importa as classes Livro e Estoque de arquivos externos
require_relative "Livro"
require_relative "Estoque"

# Criando instâncias da classe Livro
algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", "livro")
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "", "livro")
programador = Livro.new("The Pragmatic Programmer", 100, 1999, true, "", "livro")
ruby = Livro.new("Programing Ruby", 100, 2004, true, "", "livro")
revista = Livro.new("Revista de Ruby", 15, 2008, true, "", "revista")

# Criando uma instância da classe Estoque
estoque = Estoque.new

# Adicionando livros ao estoque
estoque << algoritmos << algoritmos << ruby << programador << arquitetura << ruby << ruby << revista << revista << revista
# Adiciona as instâncias dos livros ao estoque usando o operador '<<'

estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revista

# Imprime o título do livro mais vendido por título
puts estoque.livro_que_mais_vendeu_por_titulo.titulo

# Imprime o título da revista mais vendida por título
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
