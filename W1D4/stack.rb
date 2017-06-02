class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack[-1]
  end
end


stack = Stack.new

stack.add(1)
stack.add(2)
stack.add(3)
p stack.show
stack.remove
p stack.show
stack.remove
p stack.show
