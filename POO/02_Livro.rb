# Classe livro
class Livro

  # attr_reader atributos  para acesso de apenas ler
  # attr_access atributos para acesso de ler e escrever
  # attr_write atributos para acesso de apenas escrever
  attr_reader :titulo, :preco, :ano_lancamento

  # initializer da classe, ou seja, o construtor da classe
  # @atributo equivale a o this
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
  end

  # metodo retorna true ou false, pode-se colocar o ? para esses tipos de 
  # métodos
  def possui_reimpressao?
    @possui_reimpressao
  end

  def to_csv
    "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

  # métodos calcula preco private para cada objeto
  private
  def calcula_preco(base)
    if @ano_lancamento < 2006
      if @possui_reimpressao
        base * 0.9
      else
        base * 0.95
      end
    elsif @ano_lancamento <= 2000
      base * 0.96
    else
      base
    end
  end

end

# Classe Estoque
class Estoque 

  # Recebe livros
  attr_reader :livros

  # Inicia um vetor de livros pelo construtor
  def initialize
    @livros = []
  end

  # Imprime todos os livros do estoque
  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  # Dado um valor ele percorre array de livros do estoque e aponta
  # um livro com preço menor que o valor passado
  def mais_barato_que(valor)
    @livros.select do |livro|
      livro.preco < valor
    end
  end

  # método para calcular tamanho do estoque
  def total
    @livros.size
  end

  # adiciona um livro, e obriga que um livro seja preenchido de acordo com os
  # atributos que a própria classe Livro inicia
  def adiciona(livro)
    @livros << livro if livro
  end
end

def imprime_nota_fiscal(livros)
  livros.each do |livro|
    puts "Titulo: #{livro.titulo} - #{livro.preco}"
  end
end

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
    puts "Newsletter/Liquidação"
    puts livro.titulo
    puts livro.preco
    puts livro.possui_reimpressao?
  end
end



#livro_para_newsletter(algoritmos)

algoritmos = Livro.new("Algoritmos",100,1998,true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software",70,2011,true)

estoque = Estoque.new
estoque.livros << algoritmos << arquitetura
estoque.livros << Livro.new("The Pragmatic Programmer",100,1999,true)
estoque.livros << Livro.new("Programing Ruby",100,2004,true)


estoque.exporta_csv
puts estoque.mais_barato_que 80
puts estoque.total





