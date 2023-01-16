require_relative './item.rb'

class Author < Item
    attr_accessor :items
    def initialize(id, first_name, last_name)
        @id = id
        @first_name = first_name
        @last_name = last_name
        @items = []
        super(1, "Sajeel", true, 8)
    end

    def add_item(item)
        @items.push(item)
    end
end

