require_relative './musicHandler'
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

def save_musics(musics)
  list = []
  musics.each do |music|
    list.push({
      publish_date: music.publish_date,
      on_spotify: music.on_spotify,
      Genre: music.genre.name,
      Author_first_name: music.author.first_name,
      Author_second_name: music.author.last_name
    })
  end
  File.write('./musicAlbum/data/musics.json', JSON.generate(list).to_s)
end

def save_genres(genres)
  types = []
  genres.each do |genre|
    types.push({name: genre.name})
  end
  File.write('./musicAlbum/data/genres.json', JSON.generate(types).to_s)
end

def read_musics
  musics = []
  all_musics = File.read('./musicAlbum/data/musics.json')
  JSON.parse(all_musics).each do |music|
    new_music = MusicAlbum.new(music['on_spotify'], music['publish_date'])
    new_genre = Genre.new(music['genre'])
    new_author = Author.new(music['music_author_first_name'], music['music_author_second_name'])
    new_music.genre = new_genre
    new_music.author = new_author
    musics.push(new_music)
  end
  musics
end
