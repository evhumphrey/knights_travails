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

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if @children.include?(child_node)
      child_node.parent = nil
      @children.delete(child_node)
    else
      raise "Not a child"
    end
  end

end
