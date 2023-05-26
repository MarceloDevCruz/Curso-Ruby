require_relative "Produto"

# Classe Revista
class Revista
  attr_reader :numero

  include Produto

  # Inicializador da classe Revista
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, numero)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
    @editora = editora
    @numero = numero
  end

  def matches?(query)
    query=="revista" || query=="impresso"
  end

  # Método para verificar se o Revista possui reimpressão
  def possui_reimpressao?
    @possui_reimpressao
  end

end