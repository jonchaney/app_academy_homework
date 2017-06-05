def bfs root, value
  queue = [root]
  until queue.empty?
    current_node = queue.shift
    return current_node if current_node.value == target
    queue.concat current_node.children
  end
  nil
end
