Dir["./lib/*.rb"].filter { |file| require file unless file.include?("board") || file.include?("main")} 

class Board
  attr_accessor :squares, :free_squares

  def initialize
    @squares = create_board()
  end

  private 

  def create_board()
    squares = Hash.new
    8.times do |x|
      ('a'..'h').to_a.each { |y| squares[[x, y]] = nil }
    end
    return place_pieces(squares)
  end

  def place_pieces(squares)
    [1, 6].each do |x|
      ('a'..'h').to_a.each { |y| squares[[x, y]] = Pawn.new([x, y]) }
    end

    [0, 7].each do |x|
      squares[[x,'a']] = Rook.new([x,'a'])
      squares[[x,'b']] = Knight.new([x,'b'])
      squares[[x,'c']] = Bishop.new([x,'c'])
      squares[[x,'d']] = Queen.new([x,'d'])
      squares[[x,'e']] = King.new([x,'e'])
      squares[[x,'f']] = Bishop.new([x,'f'])
      squares[[x,'g']] = Knight.new([x,'g'])
      squares[[x,'h']] = Rook.new([x,'h'])
    end

    return squares
  end
end