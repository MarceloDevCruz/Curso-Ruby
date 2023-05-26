require_relative "Produto"
require_relative "Impresso"

# Classe Livro
class Livro < Produto
  attr_reader :possui_reimpressao, :possui_sobrecapa

  include Impresso

  # Inicializador da classe Livro
  def initialize(titulo, preco, ano_lancamento, editora, possui_reimpressao, possui_sobrecapa, autor)
    super(titulo, preco, ano_lancamento, editora)
    @possui_reimpressao = possui_reimpressao
    @possui_sobrecapa = possui_sobrecapa
    @autor = autor
  end

  def matches?(query)
    query=="livro" || query=="impresso"
  end

end
