class KnightPathFinder
  def initialize(start_pos = [0,0])
    @start_node = PolyTreeNode.new(start_pos)
    @move_tree = self.build_move_tree
  end

  def build_move_tree
    return nil #TODO
  end

  def find_path(end_pos)
    #TODO
  end
end
