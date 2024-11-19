require_relative 'lib/linked_list'
require_relative 'lib/node'

list = LinkedList.new
list.append('dog')
#( dog ) -> nil
list.append('cat')
#( dog ) -> ( cat ) -> nil
list.append('parrot')
 #( dog ) -> ( cat ) -> ( parrot ) -> nil
list.append('hamster')
list.append('snake')
list.append('turtle')
 #( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil
list.prepend('boi')
 #( boi) ->( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil
list.insert_at("bois",2)
p 'hi'
