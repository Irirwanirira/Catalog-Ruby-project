require_relative '../game.rb'
require_relative '../item.rb'

describe Game do
    before(:all) do
        @game = Game.new(true, 3)
        @item1 = Item.new(1, "Sajeel", true, 8)
        @item2 = Item.new(1, "Sharjeel", true, 18)
    end

    it "Should be true when published date of item is older than 10 years and last played is greater than 2 years" do
        
        
    end
end


