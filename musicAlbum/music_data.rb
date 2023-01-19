require_relative './music_handler'
require_relative './genre'
require_relative './author'
require 'json'

def initialize_file
  File.write('./musicAlbum/data/musics.json', '[]') unless
  File.exist?('./musicAlbum/data/musics.json')
  File.zero?('./musicAlbum/data/musics.json') &&
    File.write('./musicAlbum/data/musics.json', '[]')
end

initialize_file

def read_musics
  musics = []
  all_musics = File.read('./musicAlbum/data/musics.json')
  JSON.parse(all_musics).each do |music|
    new_music = MusicAlbum.new(music['on_spotify'],music['Author_first_name'], music['label'], music['publish_date'])
    new_genre = Genre.new(music['genre'])
    new_music.genre = new_genre
    musics.push(new_music)
  end
  musics
end

def save_musics(musics)
  list = []
  musics.each do |music|
    list.push(
      publish_date: music.publish_date,
      on_spotify: music.on_spotify,
      genre: music.genre.name,
      label: music.label,
      Author_first_name: music.author.first_name,
      Author_second_name: music.author.last_name
    )
  end
  File.write('./musicAlbum/data/musics.json', JSON.generate(list).to_s)
end

def save_genres(genres)
  types = []
  genres.each do |genre|
    types.push(genre: genre.genre.name)
  end
  File.write('./musicAlbum/data/genre.json', JSON.generate(types).to_s)
end
