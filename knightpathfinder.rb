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
    @visited_positions = [@start_node.value]
    build_move_tree
  end

  def new_move_positions(pos)
    all_moves = KnightPathFinder.valid_moves(pos)

    valid_moves = all_moves.reject do |move|
      @visited_positions.include?(move)
    end

    @visited_positions.concat(valid_moves)
    valid_moves
  end


  def build_move_tree
    queue = [@start_node]
    queue.each do |node|
      new_move_positions(node.value).each_with_index do |pos|
        new_child = PolyTreeNode.new(pos)
        @start_node.add_child(new_child)
        queue << new_child
      end
    end
  end

  def find_path(end_pos)
    #TODO
  end

  def trace_path_back(node)
    path_back = []

    until node == @start_node
      path_back.unshift(node.value)
      node = node.parent
    end

    path_back
  end

end
