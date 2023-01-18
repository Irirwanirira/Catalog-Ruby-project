require_relative '../game.rb'
require_relative '../item.rb'

describe Game do
    before(:all) do
        @game1 = Game.new(true, 1, "Sharjeel", true, 18)
        @game2 = Game.new(true, 3, "Zafar", true, 18)
        @game3 = Game.new(true, 3, "Sajeel", true, 8)
    end

    it "Should be true when published date of item is older than 10 years and last played is greater than 2 years" do
        expect(@game2.can_be_archived). to eql(true)
    end

    it "Should be false when published date of item is older than 10 years but last played is less than 2 years" do
        expect(@game1.can_be_archived). to eql(false)
    end

    it "Should be false when published date of item is less than 10 years but last played is greater than 2 years" do
        expect(@game3.can_be_archived). to eql(false)
    end

end


