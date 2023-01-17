require_relative './music_album'
require_relative './music_data'
require_relative './genre'
require 'json'

class MusicHandler
  attr_accessor :music
  def initialize
    @musics = music
  end

  def listern_all_music
    if @musics.length.zero?
      puts 'PLaylist is empty. Add music to play!'
    else
      @musics.each_with_index do |song, index|
        print "#{index}) On spotify: #{song.on_spotify}, Publish date: #{song.publish_date}, Genre: #{song.genre.name}, "
        print "Author: #{song.author.first_name} #{song.author.last_name}"
      end
   end
  end

  def list_all_genre
    if @musics.length.zero?
      'PLaylist is empty. Add music to play!'
    else
      specific_genre = @musics.uniq { |x| x.genre.name }
      specific_genre.each_with_index do |type, index|
        puts "#{index + 1}) #{type.genre.name}"
      end
    end
  end

  def add_musics
    puts 'let\'s create some music!'
    print 'Date of publication'
    date_of_publication = gets.chomp
    print 'is the music on Spotify? (yes/no)'
    is_on_spotify = gets.chomp
    spotify_state = check_spotify_state(is_on_spotify)
    print 'what\'s the music genre'
    genre = Genre.new(music_genre)
    print 'Author\'s firts name:'
    music_author_first_name = gets.chomp
    print 'Author\'s second name:'
    music_author_second_name = gets.chomp
    author = Author.new(music_author_first_name, music_author_second_name)
    music_select = Music_album.new(spotify_state, date_of_publication)
    music_select.genre = genre
    music_select.author = author
    @musics << music_select
    save_musics(@musics)
    puts 'Music created successfully!'
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
