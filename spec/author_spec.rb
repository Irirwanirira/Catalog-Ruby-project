require_relative '../author.rb'
require_relative '../item.rb'

describe Author do
    before(:all) do
        @author = Author.new(1, "Sajeel", "Zafar")
        @item1 = Item.new(1, "Sajeel", true, 8)
    end

    it "Should add one item to the respective author" do
        @author.add_item(@item1)
        expect(@author.items.length).to eql (1)
    end
end

