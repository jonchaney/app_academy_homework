require 'byebug'
class PolyTreeNode
  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    self.parent.children.delete(self) if parent
    @parent = node
    node.children << self if node
    self
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise "child does not exist"
    end
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    nodes = []
    nodes << self
    until nodes.empty?
      node = nodes.shift
      return node if node.value == target_value
      nodes += node.children
    end
    nil
  end

end
