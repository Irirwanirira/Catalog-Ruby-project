require_relative '../book/label'
require_relative '../book/book'

describe Label do
  before :each do
    @label = Label.new('Dark Tower', 'Black')
    @item = Item.new('samuel', 'Irirwana', '12-11-2005')
  end

  it 'Should have a title of Dark Tower' do
    expect(@label.title).to eql('Dark Tower')
  end

  it 'Should have a color of Black' do
    expect(@label.color).to eql('Black')
  end

  it 'returns 1 Book with a label' do
    @label.add_item(@item)
    expect(@label.items.length).to eq 1
  end
end
