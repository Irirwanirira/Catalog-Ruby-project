require_relative '../musicAlbum/music_album'

describe MusicAlbum do
  before :each do
    @musics = MusicAlbum.new(true, 'Joseph', 'Good', '0000-09-09')
    @musics2 = MusicAlbum.new(true, 'Sajeel', 'Zafar', '2021-09-09')
  end

  describe 'New' do
    it 'Takes in two parameter and returns a MusicAlbum object' do
      @musics.should be_an_instance_of MusicAlbum
    end
  end

  describe 'is it on_spotify?' do
    it 'Checks whether the music is on spotify' do
      @musics.on_spotify.should eql true
    end
  end

  describe 'publish_date' do
    it 'return 0000-09-09 as date of publication' do
      @musics.published_date.should eql '0000-09-09'
    end
  end

  describe 'it should return true' do
    it 'parents method returns true AND if on_spotify equals true' do
      expect(@musics.can_be_archived).to eql(true)
    end
  end

  describe 'it should return false' do
    it 'IF parents method returns false OR if on_spotify equals true' do
      expect(@musics2.can_be_archived).to eql(false)
    end
  end
end
