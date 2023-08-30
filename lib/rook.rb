class Rook
  attr_accessor :moves
  attr_reader :position

  def initialize(position, parent = nil)
    @position = position
    @moves = next_moves()
  end

  private

  def next_moves()
    permutations = []
    0..7.times { |i| permutation.append([0, i])}
    0..7.times { |i| permutation.append([0, -i])}
    0..7.times { |i| permutation.append([i, 0])}
    0..7.times { |i| permutation.append([-i, 0])}
    moves = []

    permutations.each do |permutation|
      perm_x, perm_y = permutation.each { |coord| coord }
      curr_x, curr_y = @position.each { |coord| coord }
      moves << [curr_x + perm_x, curr_y + perm_y] if (curr_x + perm_x).between?(0, 7) && (curr_y + perm_y).between?(0, 7)
    end

    return moves
  end
end