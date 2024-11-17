require_relative 'node'
require 'pry'
require 'pry-byebug'
class LinkedList #Whole List
  attr_accessor :head, :tail,:size

  def initialize
    self.head = Node.new()
    self.tail = Node.new()
    self.size = 0 #Make this -1 for 0-based indexing. Needs to happen on #prepend as well
  end

  def append(value) #Add a node containing "value" to the end
    @size = @size + 1
    if @head.value == nil
      @head = Node.new(value,nil,1)
      @tail = @head
    elsif @head.next_node == nil
      @head.next_node = Node.new(value,nil,2)
      @tail = @head.next_node
    else
      @tail.next_node = Node.new(value,nil,@size)
      @tail = @tail.next_node
    end
  end

  def prepend(value) #Add a node containing @value to the start
    @size = @size + 1
    @head = Node.new(value,@head,0) #0 Index because the loop adds one as it goes. (-1 for -based indexing)

    current_node = @head
    while current_node.next_node != nil
      current_node.index = current_node.index + 1
      current_node = current_node.next_node
    end

    @tail.index = @tail.index + 1 #The loop stops at the tail and that means that the tail index won't be updated.
  end

  def size #Return the total number of nodes in the list
    @size
  end

  def head #Return the first node on the list
    @head
  end

  def tail #Return the last node on the list
    @tail
  end

  def at(index) #Return the node at index
    return tail.value if index == @size #The loop skips the tail.

    current_node = @head
    while current_node.next_node != nil
      return current_node.value if current_node.index == index
      current_node = current_node.next_node
    end
    p "There's no such index."
  end

  def pop #Remove the last element from the list
    @tail = Node.new() #???
  end

  def contains?(value) #Return true if value is in the list

  end

  def find(value) #Return index of value and nil if it's not existant
    self.at()
  end

  def to_s #Represent LinkedList objects as strings
    "#{@value}"
  end

  def insert_at(value,index) #Insert a new node of value at index

  end

  def remove_at(index) #Remove the node at given index

  end
end
