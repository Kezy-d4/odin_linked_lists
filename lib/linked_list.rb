require_relative "node"

# Blueprint for instantiating a new linked list with given head node. Available
# instance methods handle insertion, deletion, searching, and reading operations.

# Regarding requirement number four of the assignment, self.head.data can be
# called to return the first node's data. There is no need to write a new
# method for this purpose as the getter method already exists to fetch this
# instance variable thanks to attr_accessor.
class LinkedList # rubocop:disable Metrics/ClassLength
  attr_accessor :head

  def initialize(head = nil)
    unless head.nil? || head.is_a?(Node)
      puts constructor_node_argument_error_msg
      head = nil
    end
    @head = head
  end

  # append(node) adds a new node to the end of the list
  def append(node)
    unless node.is_a?(Node)
      puts node_argument_error_msg("append")
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
      puts node_argument_error_msg("prepend")
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

  # contains?(data) returns true if any of the nodes in the list contain the
  # passed in data and otherwise returns false.
  def contains?(data)
    return false if head.nil?

    current_node = head
    until current_node.nil?
      return true if current_node.data == data

      current_node = current_node.next_node
    end
    false
  end

  # find(data) returns the index of the node containing data or nil if not
  # found
  def find(data)
    return if head.nil?

    current_node = head
    current_index = 0
    until current_node.nil?
      return current_index if current_node.data == data

      current_node = current_node.next_node
      current_index += 1
    end
  end

  # to_s represent your LinkedList objects as strings, so you can print them out
  # and preview them in the console. The format should be:
  # ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    print "Data in list: "
    current_node = head
    until current_node.nil?
      print "(#{current_node.data}) -> "
      current_node = current_node.next_node
    end
    print "(#{current_node}) "
  end

  # insert_at(node, index) inserts a new node at the given index.
  def insert_at(node, index) # rubocop:disable Metrics/MethodLength
    unless node.is_a?(Node)
      puts node_argument_error_msg("insert")
      return
    end
    current_node = head
    current_index = 0
    until current_index == index - 1
      return if current_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end
    return if current_node.nil?

    next_node = current_node.next_node
    current_node.next_node = node
    node.next_node = next_node
  end

  # remove_at(index) removes the node at the given index
  def remove_at(index) # rubocop:disable Metrics/MethodLength
    return if head.nil?

    current_node = head
    previous_node = nil
    current_index = 0
    return self.head = current_node.next_node if index.zero?

    until current_index == index
      return if current_node.nil?

      previous_node = current_node
      current_node = current_node.next_node
      current_index += 1
    end
    return if current_node.nil?

    next_node = current_node.next_node
    previous_node.next_node = next_node
  end

  private

  def node_argument_error_msg(operation)
    "ERROR! Attempted to #{operation} a non-Node argument to a linked list. " \
      "Operation aborted without changes."
  end

  def constructor_node_argument_error_msg
    "ERROR! Attempted to pass a non-Node head argument to linked list " \
      "constructor. List instantiated, but head node converted to nil."
  end
end
