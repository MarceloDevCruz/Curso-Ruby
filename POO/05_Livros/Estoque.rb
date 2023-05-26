require_relative "Contador"

# Classe Estoque
class Estoque
  attr_reader :livros

  def initialize
    @livros = []           # Inicializa a lista de livros em estoque
    @vendas = []           # Inicializa a lista de livros vendidos
    @livros.extend Contador # Estende a classe Contador para a lista de livros
  end

  def method_missing(name)
    matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"

    if matcher
      tipo = matcher[1]                 # Extrai o tipo (livro ou revista) do nome do método
      campo = matcher[2].to_sym         # Extrai o campo a ser utilizado convertendo-o para um símbolo
      que_mais_vendeu_por(tipo, &campo) # Chama o método que_mais_vendeu_por com os argumentos obtidos
    else
      super                             # Se não corresponder ao padrão esperado, chama o método super para tratar a exceção
    end
  end

  # Método verifica se o objeto da classe Estoque responde ao nome do método no padrão 
  def respond_to?(name)
    name.to_s.match ("(.+)_que_mais_vendeu_por_(.+)") || super
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

  private
  # Método para contar a quantidade de vendas de um determinado título de livro
  def quantidade_de_vendas_por(produto, &campo)
    @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
  end

  # Método para obter o item mais vendido (livro ou revista) usando um campo específico
  def que_mais_vendeu_por(tipo, &campo)
    vendas_selecionadas = @vendas.select { |item| item.tipo == tipo }
    vendas_selecionadas.max_by { |item| quantidade_de_vendas_por(item, &campo) }
  end

end
