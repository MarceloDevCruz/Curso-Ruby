require_relative "Contador"

# Classe Estoque
class Estoque
  attr_reader :livros

  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  # Método para contar a quantidade de vendas de um determinado título de livro
  def quantidade_de_vendas_por(produto, &campo)
    @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
  end

  # Método para obter o livro mais vendido por título
  def livro_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("livro", &:titulo)
  end

  # Método para obter o livro mais vendido por ano de lançamento
  def livro_que_mais_vendeu_por_ano
    que_mais_vendeu_por("livro", &:ano_lancamento)
  end

  # Método para obter o livro mais vendido por editora
  def livro_que_mais_vendeu_por_editora
    que_mais_vendeu_por("livro", &:editora)
  end

  # Método para obter a revista mais vendida por título
  def revista_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("revista", &:titulo)
  end

  # Método para obter a revista mais vendida por ano de lançamento
  def revista_que_mais_vendeu_por_ano
    que_mais_vendeu_por("revista", &:ano_lancamento)
  end

  # Método para obter a revista mais vendida por editora
  def revista_que_mais_vendeu_por_editora
    que_mais_vendeu_por("revista", &:editora)
  end

  # Método para obter o item mais vendido (livro ou revista) usando um campo específico
  def que_mais_vendeu_por(tipo, &campo)
    vendas_selecionadas = @vendas.select { |item| item.tipo == tipo }
    vendas_selecionadas.sort do |v1, v2|
      quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
    end.last
  end

  # Método para exportar os livros do estoque em formato CSV
  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  # Método para retornar os livros mais baratos que um determinado valor
  def mais_barato_que(valor)
    @livros.select { |livro| livro.preco < valor }
  end

  # Método para retornar o total de livros no estoque
  def total
    @livros.size
  end

  # Método para adicionar um livro ao estoque
  def adiciona(livro)
    @livros << livro if livro
  end

  # Operador de adição para adicionar um livro ao estoque
  def <<(livro)
    @livros << livro if livro
    self
  end

  # Método para vender um livro do estoque
  def vende(livro)
    @livros.delete(livro)
    @vendas << livro
  end

  # Método para retornar o máximo necessário de livros no estoque
  def maximo_necessario
    @livros.maximo_necessario
  end
end
