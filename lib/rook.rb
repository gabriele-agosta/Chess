class Rook
  attr_reader :moves

  def initialize(position)
    @position = position
    @moves = next_moves()
  end

  private

  def next_moves()
    permutations = []
    0..7.times { |i| permutations.append([0, i])}
    0..7.times { |i| permutations.append([0, -i])}
    0..7.times { |i| permutations.append([i, 0])}
    0..7.times { |i| permutations.append([-i, 0])}
    moves = []

    permutations.each do |permutation|
      perm_x, perm_y = permutation.each { |coord| coord }
      curr_x, curr_y = @position.each { |coord| coord }
      new_y = curr_y.ord + perm_y
      moves << [curr_x + perm_x, new_y.chr] if (curr_x + perm_x).between?(0, 7) && new_y.between?(97, 104)
    end

    return moves
  end
end