require_relative './item.rb'

class Game < Item
    alias_method :parent_can_be_archived, :can_be_archived

    def initialize(multiplayer, last_played_at)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
        super(1, "Sajeel", true, 8)
    end

    def can_be_archived   
        @last_played_at > 2 && parent_can_be_archived
    end
end

game = Game.new(true, 3)

p game.can_be_archived