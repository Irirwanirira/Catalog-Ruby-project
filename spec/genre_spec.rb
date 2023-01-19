require_relative '../genre'

describe Genre do
  before :each do
    @genres = Genre.new('pop')
  end

  describe 'testing initialize for genre' do
    it 'should display music genre ' do
      expect(@genres).to be_an_instance_of(Genre)
    end
    it 'genre has to be pop' do
      expect(@genres.name).to eq 'pop'
    end
  end
end
