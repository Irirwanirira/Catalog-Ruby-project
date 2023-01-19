require_relative './game/game'
require_relative './game/author'
require_relative './app'
require 'json'

def creating_file
  File.write('./storage/games.json', '[]') unless
  File.exist?('./storage/games.json')
  File.write('./storage/authors.json', '[]') unless
  File.exist?('./storage/authors.json')
  File.write('./storage/books.json', '[]') unless
  File.exist?('./storage/books.json')
  File.write('./storage/labels.json', '[]') unless
  File.exist?('./storage/labels.json')
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
      label_title: game.label,
      published_date: game.published_date
    )
  end
  File.write('./storage/games.json', JSON.pretty_generate(gameslist).to_s)
end

def savebooks_json(books)
  bookslist = []
  books.each do |book|
    bookslist.push(
      publisher: book.publisher,
      cover_state: book.cover_state,
      author_first: book.author.first_name,
      author_last: book.author.last_name,
      label_title: book.label.title,
      label_color: book.label.color,
      published_date: book.published_date
    )
  end
  File.write('./storage/books.json', JSON.pretty_generate(bookslist).to_s)
end

def saveauthor_json(authors)
  authorlist = []
  authors.each do |author|
    authorlist.push(
      author_first: author.first_name,
      author_last: author.last_name
    )
  end
  File.write('./storage/authors.json', JSON.pretty_generate(authorlist).to_s)
end

def savelabels_json(labels)
  labellist = []
  labels.each do |label|
    labellist.push(
      label_title: label.title,
      label_color: label.color
    )
  end
  File.write('./storage/labels.json', JSON.pretty_generate(labellist).to_s)
end

def read_games
  games = []
  allgames = JSON.parse(File.read('./storage/games.json'))
  allgames.each do |game|
    newauthor = Author.new(game['author_first'], game['author_last'])
    newgame = Game.new(game['multiplayer'], game['last_played_at'], newauthor, game['label_title'],
                       game['published_date'])
    games.push(newgame)
  end
  games
end

def read_books
  books = []
  allbooks = JSON.parse(File.read('./storage/books.json'))
  allbooks.each do |book|
    newlabel = Label.new(book['label_title'], book['label_color'])
    newauthor = Author.new(book['author_first'], book['author_last'])
    newbook = Book.new(book['publisher'], book['cover_state'], newauthor, newlabel,
                       book['published_date'])
    books.push(newbook)
  end
  books
end

def read_authors
  authors = []
  allauthors = JSON.parse(File.read('./storage/authors.json'))
  allauthors.each do |author|
    newauthor = Author.new(author['author_first'], author['author_last'])
    authors.push(newauthor)
  end
  authors
end

def read_labels
  labels = []
  alllabels = JSON.parse(File.read('./storage/labels.json'))
  alllabels.each do |label|
    newlabel = Label.new(label['label_title'], label['label_color'])
    labels.push(newlabel)
  end
  labels
end
