class King
  attr_accessor :moves
  attr_reader :position

  def initialize(position, parent = nil)
    @position = position
    @moves = next_moves()
  end

  private

  def next_moves()
    permutations = [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1]]
    moves = []

    permutations.each do |permutation|
      perm_x, perm_y = permutation.each { |coord| coord }
      curr_x, curr_y = @position.each { |coord| coord }
      moves << [curr_x + perm_x, curr_y + perm_y] if (curr_x + perm_x).between?(0, 7) && (curr_y + perm_y).between?(0, 7)
    end

    return moves
  end
end