require_relative "Produto"

# Classe Ebook
class Ebook < Produto

  def matches?(query)
    query=="ebook" || query=="digital"
  end

end