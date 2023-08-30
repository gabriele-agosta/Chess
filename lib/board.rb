Dir["./lib/*.rb"].filter { |file| require file unless file.include?("board") || file.include?("main")} 

class Board
    attr_accessor :squares, :free_squares

    def initialize
        @squares = create_board()
        @free_squares = place_pieces()
    end

    private 

    def create_board()
        squares = []
        8.times do |x|
            ('a'..'h').to_a.each do |y|
                squares.append(Square.new(x, y))
            end
        end

        return squares
    end

    def place_pieces()
    end
end