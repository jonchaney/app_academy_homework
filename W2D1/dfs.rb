def dfs node, target
  return node if node.vale == target
  node.children.each do |child|
    result = dfs child target
    return result if result
  end
  nil
end
