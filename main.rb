require_relative "lib/linked_list"
require_relative "lib/node"

node1 = Node.new("A")
node2 = Node.new("B")
node3 = Node.new("C")

node1.next_node = node2
node2.next_node = node3

list = LinkedList.new
list.append(node1)
list.prepend(Node.new(0))
list.pop
list.insert_at(Node.new("C"), 3)
list.remove_at(2)

puts list

puts "Size: #{list.size}"
puts "Tail: #{list.tail}"
puts "Data at index 1: #{list.at(1)}"
puts "List contains data nil?: #{list.contains?(nil)}"
puts "Index of node containing data A: #{list.find('A')}"

# Assignment testing
# list = LinkedList.new

# list.append(Node.new("dog"))
# list.append(Node.new("cat"))
# list.append(Node.new("parrot"))
# list.append(Node.new("hamster"))
# list.append(Node.new("snake"))
# list.append(Node.new("turtle"))

# puts list
