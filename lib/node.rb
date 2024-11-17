class Node
  attr_accessor :value, :next_node, :index

  def initialize(value = nil, next_node = nil,index = nil)
    @value, @next_node, @index = value, next_node, index
  end
end
