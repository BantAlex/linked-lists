require_relative 'lib/linked_list'
require_relative 'lib/node'

list = LinkedList.new
list.append('dog')
p list #( dog ) -> nil
list.append('cat')
p list #( dog ) -> ( cat ) -> nil
list.append('parrot')
p list #( dog ) -> ( cat ) -> ( parrot ) -> nil
list.append('hamster')
list.append('snake')
list.append('turtle')
p list #( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil
p list.size#6
p list.head.value#dog
p list.tail#turtle
p "======================"
list2 = LinkedList.new
list2.append('dog')
p list2
list2.prepend('cat')
p list2
