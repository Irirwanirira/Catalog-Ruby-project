require_relative './game'
require_relative './author'
require_relative './app'
require 'json'

def creating_file
  File.write('./gameStorage/games.json', '[]') unless
  File.exist?('./gameStorage/games.json')
end

creating_file

def savegame_json(games)
  gameslist = []
  games.each do |game|
    gameslist.push(
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at,
      author_first: game.author.first_name,
      author_last: game.author.last_name,
      archived: game.archived,
      published_date: game.published_date
    )
  end
  File.write('./gameStorage/games.json', JSON.pretty_generate(gameslist).to_s)
end

def saveauthor_json(authors)
  authorlist = []
  authors.each do |author|
    authorlist.push(
      author_first: author.first_name,
      author_last: author.last_name
    )
  end
  File.write('./gameStorage/authors.json', JSON.pretty_generate(authorlist).to_s)
end
