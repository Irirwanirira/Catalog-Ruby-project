require_relative './music_album'
require_relative './music_data'
require_relative './genre'
require_relative './author'
require 'json'

class MusicHandler
  attr_accessor :music
  def initialize
    @musics = read_musics
  end

  def list_all_genre
    if @musics.length.zero?
     puts 'Music genre is empty, we are sorry!'
    else
      specific_genre = @musics.uniq { |sort| sort.genre.name }
      specific_genre.each_with_index do |type, index|
        puts "#{index + 1}) #{type.genre.name}"
      end
    end
  end

  def add_musics
    puts 'let\'s create some music!'
    print 'Date of publication: '
    date_of_publication = gets.chomp
    print 'is the music on Spotify? (yes/no) '
    is_on_spotify = gets.chomp
    spotify_state = check_spotify_state(is_on_spotify)
    print 'what\'s the music genre: '
    music_genre = gets.chomp
    genre = Genre.new(music_genre)
    print 'Author\'s first name: '
    music_author_first_name = gets.chomp
    print 'Author\'s second name: '
    music_author_second_name = gets.chomp
    author = Author.new(music_author_first_name, music_author_second_name)
    music_select = MusicAlbum.new(spotify_state, date_of_publication)
    music_select.genre = genre
    music_select.author = author
    @musics << music_select
    save_musics(@musics)
    puts 'Music created successfully!'
  end

  def listern_all_music
    if @musics.length.zero?
      puts 'PLaylist is empty. Add music to play!'
    else
      @musics.each_with_index do |song, index|
        print "#{index})  Publish date: #{song.publish_date}, On spotify?: #{song.on_spotify}, genre: #{song.genre.name}, "
        print "Author: #{song.author.first_name} #{song.author.last_name}"
      end
   end
  end

  def check_spotify_state(state)
    case state
    when 'yes'
      true
    when 'no'
      false
    else
      puts 'invalid options'
      puts ''
      puts 'Is your music on spotify? (yes/no)'
      state = gets.chomp
      check_spotify_state(state)
    end
  end
end
