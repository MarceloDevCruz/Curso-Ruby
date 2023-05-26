# Classe Livro
class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  # Inicializador da classe Livro
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
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

# Módulo Contador
module Contador
  def <<(livro)
    push(livro)
    @maximo_necessario = size if @maximo_necessario.nil? || @maximo_necessario < size
    self
  end

  attr_reader :maximo_necessario
end

# Classe Estoque
class Estoque
  attr_reader :livros

  def initialize
    @livros = []
    @livros.extend Contador
  end

  # Método para exportar os livros do estoque em formato CSV
  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  # Método para retornar os livros mais baratos que um determinado valor
  def mais_barato_que(valor)
    @livros.select do |livro|
      livro.preco < valor
    end
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

  # Método para remover um livro do estoque
  def remove(livro)
    @livros.delete livro
  end

  # Método para retornar o máximo necessário de livros no estoque
  def maximo_necessario
    @livros.maximo_necessario
  end
end

# Método para imprimir uma nota fiscal com os livros
def imprime_nota_fiscal(livros)
  livros.each do |livro|
    puts "Título: #{livro.titulo} - Preço: #{livro.preco}"
  end
end

# Método para enviar um livro para a newsletter de liquidação
def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
    puts "Newsletter/Liquidação"
    puts livro.titulo
    puts livro.preco
    puts livro.possui_reimpressao?
  end
end

# Adicionando a funcionalidade de contador ao Array
class Array
  attr_reader :maximo_necessario

  def <<(livro)
    push(livro)
    @maximo_necessario = size if @maximo_necessario.nil? || @maximo_necessario < size
    self
  end
end

# Criando instâncias da classe Livro
algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)
programador = Livro.new("The Pragmatic Programmer", 100, 1999, true)
ruby = Livro.new("Programing Ruby", 100, 2004, true)

# Criando uma instância da classe Estoque
estoque = Estoque.new

# Adicionando livros ao estoque
estoque << algoritmos
puts estoque.maximo_necessario
estoque << arquitetura
puts estoque.maximo_necessario
estoque << programador << ruby
puts estoque.maximo_necessario

# Removendo um livro do estoque
estoque.remove(algoritmos)
puts estoque.maximo_necessario
