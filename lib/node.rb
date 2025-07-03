# Blueprint for instantiating a new node with given data. Each node instance has
# access to the setter method next_node which can be used to assign the link
# to its next node.

# For example:
# node1 = Node.new("A")
# node2 = Node.new("B")
# node1.next_node = node2
class Node
  attr_accessor :data, :next_node

  def initialize(data = nil)
    @data = data
  end
end
