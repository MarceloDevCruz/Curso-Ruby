# Classe Ebook
class Ebook
  attr_reader :titulo, :preco, :ano_lancamento, :editora

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

  # Método para exportar as informações do Ebook em formato CSV
  def to_csv
    "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

  # Método privado para calcular o preço do Ebook com base em seu ano de lançamento e a presença de reimpressão.
  # O método é chamado internamente pela classe Ebook.
  private
  def calcula_preco(base)
    if @ano_lancamento < 2006
      if @possui_reimpressao
        base * 0.9  # Aplica um desconto de 10% se o Ebook possui reimpressão
      else
        base * 0.95  # Aplica um desconto de 5% se o Ebook não possui reimpressão
      end
    elsif @ano_lancamento <= 2000
      base * 0.96  # Aplica um desconto de 4% se o Ebook foi lançado entre 2001 e 2006
    else
      base  # Mantém o preço base se o Ebook foi lançado após 2006
    end
  end
end