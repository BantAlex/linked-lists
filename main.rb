require_relative 'lib/linked_list'
require_relative 'lib/node'

list = LinkedList.new
list.append('dog') #( dog ) -> nil
list.append('cat') #( dog ) -> ( cat ) -> nil
puts list
