class Array

  def binary_search(target, &prc)
    prc ||= Proc.new {|x,y| x<=>y}

    return nil if size == 0

    midpoint = length / 2

    case prc.call(self[midpoint], target)
    when 0
      return midpoint
    when 1
      return self.dup.take(midpoint).binary_search(target)
    else
      search_result = self.dup.drop(midpoint + 1).binary_search(target)
      search_result.nil? ? nil : search_result + (1 + midpoint)
    end
  end

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x<=>y}

    return self if count <= 1

    midpoint = length / 2

    sorted_left = self.take(midpoint).merge_sort
    sorted_right = self.drop(midpoint).merge_sort

    sorted_merge(sorted_left, sorted_right, &prc)

  end

  def sorted_merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)
    merged
  end

  def quick_sort(&prc)
    prc ||= Proc.new {|x,y| x<=>y}

    return self if self.length <= 1

    pivot = self.first

    left = self[1..-1].select {|el| prc.call(el, pivot) == -1}
    right = self[1..-1].select {|el| prc.call(el, pivot) != -1}

    left.quick_sort + [pivot] + right.quick_sort

  end

end


p [1,2,3,4,5,6,7,8].binary_search(1)

p [6,4,7,6,8,9,2].merge_sort

p [6,4,7,6,8,9,2].quick_sort
