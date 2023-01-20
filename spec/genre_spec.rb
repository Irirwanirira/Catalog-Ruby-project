require_relative '../musicAlbum/genre'

describe Genre do
  before :each do
    @genres = Genre.new('pop')
    @item = Item.new('Sajeel', 'Gift', '03/01/2010')
  end

  describe 'testing initialize for genre' do
    it 'should display music genre ' do
      expect(@genres).to be_an_instance_of(Genre)
    end
    it 'genre has to be pop' do
      expect(@genres.name).to eq 'pop'
    end
    it 'Should add one item to the respective author' do
      @genres.add_item(@item)
      expect(@genres.items.length).to eql(1)
    end
  end
end
