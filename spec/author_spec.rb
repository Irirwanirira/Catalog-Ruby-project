require_relative '../game/author'
require_relative '../item'

describe Author do
  before(:all) do
    @author = Author.new('Sajeel', 'Zafar')
    @item1 = Item.new('Sajeel', 'Gift', '03/01/2010')
  end

  it 'Should add one item to the respective author' do
    @author.add_item(@item1)
    expect(@author.items.length).to eql(1)
  end

  it 'Should have first name of author to be Sajeel' do
    expect(@author.first_name).to eql('Sajeel')
  end

  it 'Should have last name of author to be Zafar' do
    expect(@author.last_name).to eql('Zafar')
  end
end
