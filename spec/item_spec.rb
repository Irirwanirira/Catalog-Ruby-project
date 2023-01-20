require_relative '../item'
require_relative '../game/author'
require_relative '../book/label'
require_relative '../musicAlbum/genre'

describe Item do
  before :each do
    @label = Label.new('Dark Tower', 'Black')
    @author = Author.new('Sajeel', 'Zafar')
    @genres = Genre.new('pop')
    @item = Item.new('Joseph', 'Irirwana', '12-11-2005')
    @item2 = Item.new('Joseph', 'Irirwana', '12-11-2021')
  end

  it 'Should have can be archived to be true' do
    expect(@item.can_be_archived).to eql(true)
  end

  it 'Should have can be archived to be false' do
    expect(@item2.can_be_archived).to eql(false)
  end

  it 'Should have an author object "author"' do
    @item.add_author(@author)
    expect(@item.author).to eql(@author)
  end

  it 'Should have an label object "label"' do
    @item.add_label(@label)
    expect(@item.label).to eql(@label)
  end

  it 'Should be moved to archived since can be archived is true' do
    @item.move_to_archive
    expect(@item.archived).to eql(true)
  end

  it 'Moved to archived should be false since can be archived is false' do
    @item2.move_to_archive
    expect(@item2.archived).to eql(false)
  end
end
