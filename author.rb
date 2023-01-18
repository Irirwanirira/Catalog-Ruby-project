require_relative './item.rb'

class Author
    attr_accessor :items
    attr_reader :first_name, :last_name
    def initialize(first_name, last_name)
        @id = Random.rand(1..1000)
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

    def add_item(item)
        @items.push(item) unless @items.include?(item)
        item.add_author(self)
    end
end

# author = Author.new(1, "Sajeel", "Zafar")
# item1 = Item.new(1, "Sharjeel", true, 8)
# item2 = Item.new(1, "Raheel", true, 18)

# author.add_item(item1)
# author.add_item(item2)

# p author.items
# author.items.each do |item|
#     if item.author.first_name == "Sajeel"
#       puts "Good work"
#     end
# end