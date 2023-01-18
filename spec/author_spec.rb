require_relative '../author'
require_relative '../item'

describe Author do
  before(:all) do
    @author = Author.new('Sajeel', 'Zafar')
    @item1 = Item.new('Sajeel', true, '03/01/2010')
  end

  it 'Should add one item to the respective author' do
    @author.add_item(@item1)
    expect(@author.items.length).to eql(1)
  end
end
