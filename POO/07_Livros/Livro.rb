require_relative "Produto"

# Classe Livro
class Livro
  attr_reader :possui_reimpressao, :possui_sobrecapa

  include Produto

  # Inicializador da classe Livro
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, possui_sobrecapa, autor)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
    @editora = editora
    @possui_sobrecapa = possui_sobrecapa
    @autor = autor
  end

  def matches?(query)
    query=="livro" || query=="impresso"
  end

  # Método para verificar se o livro possui reimpressão
  def possui_reimpressao?
    @possui_reimpressao
  end

end
