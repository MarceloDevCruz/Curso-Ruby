require_relative "Produto"
require_relative "Impresso"

# Classe Revista
class Revista < Produto
  attr_reader :numero

  include Impresso

  # Inicializador da classe Revista
  def initialize(titulo, preco, ano_lancamento, editora, possui_reimpressao, numero)
    super(titulo, preco, ano_lancamento, editora)
    @possui_reimpressao = possui_reimpressao
    @numero = numero
  end

  def matches?(query)
    query=="revista" || query=="impresso"
  end

end