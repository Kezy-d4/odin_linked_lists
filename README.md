# Ruby Linked List
A custom Ruby linked list implementation developed as part of 
[The Odin Project](https://www.theodinproject.com/) curriculum. Here's a link to
[the relevant project lesson](https://www.theodinproject.com/lessons/ruby-linked-lists).

# How to Install and Run
1. Clone this repository onto your local machine
2. Ensure you have the required Ruby version installed according to the `.ruby-version` file.
3. Run the main file in the root of the repository via bundler

# Features
This implementation is flexible and well documented. The instance methods available
to the `LinkedList` class seamlessly handle common insertion, deletion, searching,
and reading operations.

# Reflections
There are issues with this implementation that I have noticed in hindsight. I am
choosing to move forward and keep them in mind as lessons learned for the future. 

For one, the `LinkedList` instance methods which add a new node to the list in 
some way each expect the user to pass in a `Node` instance. This leads to 
unnecessarily convoluted code to verify the passed in argument and keep the user
informed. It would be simpler to expect the user to pass in data of their 
choosing and instantiate the node within the method itself.

Additionally, this implementation grants the user full getter and setter access 
to a `Node` instance’s `data` and `next_node` variables, as well as a 
`LinkedList` instance’s `head` variable. This is potentially dangerous and could
easily lead to issues. It would be safer to deny the user such access and 
instead manipulate the variables as necessary within any instance methods.

These concerns aside, the implementation should be flexible and resilient.