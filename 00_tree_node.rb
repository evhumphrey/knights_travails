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
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    node.children << self unless node.nil?
  end
end
