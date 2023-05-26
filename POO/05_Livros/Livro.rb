# Classe Livro
class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :editora, :tipo

  # Inicializador da classe Livro
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, tipo)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
    @editora = editora
    @tipo = tipo
  end

  # Método para verificar se o livro possui reimpressão
  def possui_reimpressao?
    @possui_reimpressao
  end

  # Método para exportar as informações do livro em formato CSV
  def to_csv
    "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

  # Método privado para calcular o preço do livro com base em seu ano de lançamento e a presença de reimpressão.
  # O método é chamado internamente pela classe Livro.
  private
  def calcula_preco(base)
    if @ano_lancamento < 2006
      if @possui_reimpressao
        base * 0.9  # Aplica um desconto de 10% se o livro possui reimpressão
      else
        base * 0.95  # Aplica um desconto de 5% se o livro não possui reimpressão
      end
    elsif @ano_lancamento <= 2000
      base * 0.96  # Aplica um desconto de 4% se o livro foi lançado entre 2001 e 2006
    else
      base  # Mantém o preço base se o livro foi lançado após 2006
    end
  end
end