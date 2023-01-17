require_relative './music_album'

class Genre
    attr_accessor :items, :name
    def initialize
        @id = Random.rand(1..1000)
        @name = name
        @item = []
    end

    def add_items(item)
        @items.push(item)
        item.genre = self
    end
end
