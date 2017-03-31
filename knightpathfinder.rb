require_relative '00_polytreenode'
require 'byebug'

class KnightPathFinder

  KNIGHT_MOVES = [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1]
  ]

  def self.valid_moves(pos)
    all_moves = []

    KNIGHT_MOVES.each do |move|
      x = pos.first + move.first
      y = pos.last + move.last
      all_moves << [x, y] if KnightPathFinder.in_board?([x, y])
    end

    all_moves
  end

  def self.in_board?(pos)
    pos.all? { |i| i.between?(0, 7) }
  end

  def initialize(start_pos = [0, 0])
    @start_node = PolyTreeNode.new(start_pos)
    @move_tree = self.build_move_tree
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    all_moves = KnightPathFinder.valid_moves(pos)

    valid_moves = all_moves.reject do |move|
      @visited_positions.include?(move)
    end

    @visited_positions.concat(valid_moves)
  end


  def build_move_tree
    return nil #TODO
  end

  def find_path(end_pos)
    #TODO
  end
end
