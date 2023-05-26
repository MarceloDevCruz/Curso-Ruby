require_relative "Produto"

# Classe Ebook
class Ebook

  include Produto

  # Inicializador da classe Ebook
  def initialize(titulo, preco, ano_lancamento, editora)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def matches?(query)
    query=="ebook" || query=="digital"
  end

end