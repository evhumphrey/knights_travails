class PolyTreeNode
  def initialize(value = nil)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent = node
    node.children << self
  end
end
