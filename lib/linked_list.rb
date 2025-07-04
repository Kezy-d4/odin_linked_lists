require_relative "node"

# Blueprint for instantiating a new linked list with given head node. Available
# instance methods handle insertion, deletion, searching, and reading operations.
class LinkedList
  # Regarding requirement number four of the assignment, self.head.data can be
  # called to return the first node's data. There is no need to write a new
  # method for this purpose as the getter method already exists to fetch this
  # instance variable thanks to attr_accessor.

  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  # append(node) adds a new node to the end of the list
  def append(node)
    unless node.is_a?(Node)
      puts error_msg("append")
      return
    end
    return self.head = node if head.nil?

    current_node = head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node.next_node = node
  end

  # prepend(node) adds a new node to the start of the list
  def prepend(node)
    unless node.is_a?(Node)
      puts error_msg("prepend")
      return
    end
    return self.head = node if head.nil?

    node.next_node = head
    self.head = node
  end

  # size returns the total number of nodes in the list
  def size
    count = 0
    current_node = head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  # tail returns the last node in the list
  def tail
    return if head.nil?

    current_node = head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node.data
  end

  # at(index) returns the node at the given index
  def at(index)
    return if head.nil?
    return unless index.between?(0, size - 1)

    current_node = head
    current_index = 0
    until current_index == index
      current_node = current_node.next_node
      current_index += 1
    end
    current_node.data
  end

  # pop removes the last element from the list
  def pop
    return if head.nil?
    return self.head = nil if head.next_node.nil?

    current_node = head
    previous_node = nil
    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
  end

  # Useful for debugging and testing
  def print_all_nodes
    current_node = head
    until current_node.nil?
      p current_node.data
      current_node = current_node.next_node
    end
  end

  private

  def error_msg(operation)
    "ERROR! Attempted to #{operation} a non-Node object to a linked list. " \
      "Operation aborted without changes."
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
list.prepend(Node.new(0))
list.pop

puts "Data:"
list.print_all_nodes

puts "Size: #{list.size}"
puts "Tail: #{list.tail}"
puts "Data at index 1: #{list.at(1)}"
