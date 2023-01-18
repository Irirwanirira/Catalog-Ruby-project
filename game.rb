require_relative './item.rb'

class Game < Item
    alias_method :parent_can_be_archived, :can_be_archived

    def initialize(multiplayer, last_played_at, id, author, archived, published_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
        super(id, author, archived, published_date)
    end

    def can_be_archived   
        @last_played_at > 2 && parent_can_be_archived
    end
end