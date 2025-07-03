require_relative "node"

# Blueprint for instantiating a new linked list with given head node. Available
# instance methods handle insertion, deletion, searching, and reading operations.
class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  # append(node) adds a new node to the end of the list
  def append(node)
    return unless node.is_a?(Node)
    return self.head = node if head.nil?

    current_node = head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node.next_node = node
  end

  # Useful for debugging and testing
  def print_all_nodes
    current_node = head
    until current_node.nil?
      p current_node.data
      current_node = current_node.next_node
    end
  end
end

# Sample code:
node1 = Node.new("A")
node2 = Node.new
node3 = Node.new("C")

node1.next_node = node2
node2.next_node = node3

list = LinkedList.new
list.append(node1)
list.print_all_nodes
