require_relative '../musicAlbum/music_album'

describe MusicAlbum do
  before :each do
    @musics = MusicAlbum.new true, '0000-09-09'
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

  describe ' publish_date' do
    it 'retur 0000-09-09 as adate of publication' do
      @musics.publish_date.should eql '0000-09-09'
    end
  end
end
