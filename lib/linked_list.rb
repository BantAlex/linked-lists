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
    while current_node.next_node != nil #?Maybe current_node != @tail?
      current_node.index = current_node.index + 1
      current_node = current_node.next_node
    end

    @tail.index = @tail.index + 1 #The loop stops at the tail and that means that the tail index won't be updated.
  end

  def at(index) #Return the node at index
    return @tail.value if index == @size #The loop skips the tail

    current_node = @head
    while current_node.next_node != nil #?Maybe current_node != @tail?
      return current_node.value if current_node.index == index
      current_node = current_node.next_node
    end
    p "There's no such index."
  end

  def pop #Remove the last element from the list
    @size = @size - 1

    current_node = @head
    while current_node.next_node != nil #?Maybe current_node != @tail?
      @tail = current_node if current_node.next_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node,@tail.next_node = nil
  end

  def contains?(value) #Return true if value is in the list
    current_node = @head
    while current_node.next_node != nil #?Maybe current_node != @tail?
      return true if current_node.value == value
      current_node = current_node.next_node
    end

  return false unless value == @tail.value
  return true
  end

  def find(value) #Return index of value and nil if it's not existant#?Maybe I can use self.contains? after refactoring?
    return @tail.index if @tail.value == value

    current_node = @head
    while current_node.next_node != nil #?Maybe current_node != @tail?
      return current_node.index if current_node.value == value
      current_node = current_node.next_node
    end
  end

  def insert_at(value,index) #Insert a new node of value at index
    @found = false
    return "Just use append..." if index == @size
    return "Just use prepend..." if index == 1
    return "That's not a correct index" if index > @size || index < 1
    @current_tail_value = @tail.value

    current_node = @head
    while current_node.next_node != nil #?Maybe current_node != @tail?
      if @found
        @next_node_value = current_node.next_node.value #holds parrot
        current_node.next_node.value =  @node_value #makes dog next to dog
        @node_value = @next_node_value
      elsif current_node.index == index
        @node_value = current_node.next_node.value #holds cat
        current_node.next_node.value =  current_node.value #makes cat into dog
        current_node.value = value #makes dog into value
        @found = true
      end
      current_node = current_node.next_node
    end

    self.append(@current_tail_value)
  end

  def remove_at(index) #Remove the node at given index
    return "Just use pop..." if index == @size
    return "No such index is avaiable" if index > @size
    @found = false

    current_node = @head
    while current_node.next_node != nil #?Maybe current_node != @tail?
      if @found
        current_node.value = current_node.next_node.value
      elsif current_node.index == index
        current_node.value = current_node.next_node.value
        @found = true
      end

      current_node = current_node.next_node
    end
    self.pop()
  end

  def to_s #Represent LinkedList objects as strings
    result = ""

    current_node = @head
    while current_node
      result += "(#{current_node.value})"
      result += " => " if current_node.next_node

      current_node = current_node.next_node
    end
  result
  end

end
