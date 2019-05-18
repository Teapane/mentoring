class Node
  attr_accessor :surname, :next_node
  def initialize(surname, next_node = nil)
    @surname = surname
    @next_node = next_node
  end
end

# For this iteration, build a node class that can perform these functions:

# > require "./lib/node"
# > node = Node.new("Burke")
# => <Node @surname="Burke" @next_node=nil #5678904567890>
# > node.surname
# => "Burke"
# > node.next_node
# => nil
