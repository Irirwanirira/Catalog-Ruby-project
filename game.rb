require_relative './item.rb'
require 'date'

class Game < Item
    alias_method :parent_can_be_archived, :can_be_archived
    

    def initialize(multiplayer, last_played_at, author, archived, published_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
        super(author, archived, published_date)
    end
    attr_reader :last_played_at, :multiplayer, :archived, :published_date

    def can_be_archived
        diff = Date.today - Date.parse(@last_played_at)
        diff > 730 && parent_can_be_archived
    end
    
end
