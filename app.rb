require_relative './musicAlbum/musicHandler'

class App
  attr_accessor :music_handler

  def initialize
    @music_handler = MusicHandler.new
  end

  def music
    puts 'Please select one of the task among the following
        1. List all music in the Album
        2. List all genres
        3. Add a music to the Album'

    selection = gets.chomp.to_i

    case selection
    when 1
      @music_handler.listern_all_music
    when 2
      @music_handler.list_all_genre
    when 3
      @music_handler.add_musics
    else
      puts 'Invalid selection, PLease try again'
      music
    end
  end
end
