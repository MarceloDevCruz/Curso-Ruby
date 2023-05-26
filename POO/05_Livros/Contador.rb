# Módulo Contador
module Contador
  def <<(livro)
    # O método de adição '<<' é redefinido para adicionar um livro à coleção e atualizar o máximo necessário
    push(livro)
    # Verifica se o valor máximo necessário é nulo ou menor que o tamanho atual da coleção
    @maximo_necessario = size if @maximo_necessario.nil? || @maximo_necessario < size
    self
  end

  attr_reader :maximo_necessario
  # Permite ler o valor do máximo necessário fora do módulo
end
