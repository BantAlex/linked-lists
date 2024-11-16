require_relative 'node'
require 'pry'
require 'byebug'
class LinkedList #Whole List
  attr_accessor :head, :tail,:size
  def initialize
    self.head = Node.new()
    self.tail = Node.new()
    self.size = 0
  end

  def append(value) #Add a node containing @value to the end
    @ap_node = Node.new(value)
    @head = @ap_node if @head.value == nil
    @tail = @ap_node
    # binding.pry
    @size = @size + 1
  end

  def prepend(value) #Add a node containing @value to the start
    @pre_node = Node.new(value,@head)
    @head = value
    @size = @size + 1
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

  end

  def pop #Remove the last element from the list

  end

  def contains?(value) #Return true if value is in the list

  end

  def find(value) #Return index of value and nil if it's not existant

  end

  def insert_at(value,index) #Insert a new node of value at index

  end

  def remove_at(index) #Remove the node at given index

  end
end
