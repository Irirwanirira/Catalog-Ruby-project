require_relative './item'
require_relative './game/game'
require_relative './game/author'
require_relative './json_read_write'
require_relative './book/book'
require_relative './book/label'

class App
  attr_accessor :listofgames, :listofauthors

  def initialize
    @listofgames = read_games
    @listofauthors = read_authors
    @listofbooks = read_books
    @listoflabels = read_labels
  end

  def list_games
    @listofgames.each_with_index do |game, index|
      puts "#{index + 1}: Multiplayer: #{game.multiplayer}, Last played On: #{game.last_played_at},
      Author First Name: #{game.author.first_name}, Author Last Name: #{game.author.last_name},
      Archived: #{game.archived}, Publication Date: #{game.published_date}\n\n"
    end
  end

  def list_authors
    puts "List of Authors: \n"
    @listofauthors.each_with_index do |author, index|
      print "#{index + 1}: #{author.first_name} #{author.last_name}\n"
    end
  end

  def create_game
    print 'Is this game multiplayer (Y/N): '
    multiplayer = gets.chomp
    print 'When is the game last played at? (DD/MM/YYYY): '
    last_played_at = gets.chomp
    print "Game's author first name: "
    author_first = gets.chomp
    print "Game's author last name: "
    author_last = gets.chomp
    print 'Title : '
    label_title = gets.chomp
    print 'Published date of the game (DD/MM/YYYY): '
    date = gets.chomp
    print "\n Game Created Successfully \n"
    newauthor = Author.new(author_first, author_last)
    newgame = Game.new(multiplayer, last_played_at, newauthor, label_title, date)
    @listofgames.push(newgame)
    @listofauthors.push(newauthor)
    savegame_json(@listofgames)
    saveauthor_json(@listofauthors)
  end

  def create_book
    print 'Publisher : '
    book_publisher = gets.chomp
    print 'Cover State : '
    book_cover_state = gets.chomp
    print "Book's author first name: "
    author_first = gets.chomp
    print "Book's author last name: "
    author_last = gets.chomp
    print 'Title : '
    label_title = gets.chomp
    print 'Published date of the game (DD/MM/YYYY): '
    date = gets.chomp
    print 'Color : '
    color = gets.chomp
    new_label = Label.new(label_title, color)
    author = Author.new(author_first, author_last)
    mybook = Book.new(book_publisher, book_cover_state, author, new_label, date)
    print "\n Book Created Successfully \n"
    @listofbooks.push(mybook)
    @listoflabels.push(new_label)
    savebooks_json(@listofbooks)
    savelabels_json(@listoflabels)
  end

  def list_books
    @listofbooks.each_with_index do |book, index|
      puts "#{index + 1}: Publisher: #{book.publisher}, Label: #{book.cover_state},
      Publication Date: #{book.published_date}\n\n"
    end
  end

  def list_labels
    @listoflabels.each_with_index do |label, index|
      puts "#{index + 1}: #{label.title}, #{label.color}\n\n"
    end
  end

  def launch_books
    puts "Welcome to the Books Section

        1. List of Books
        2. List of Labels
        3. Add a Book
        4. Back to main menu

        Please select any one option: "
    input = gets.chomp
    case input
    when '1'
      list_books
      launch_books
    when '2'
      list_labels
      launch_books
    when '3'
      create_book
      launch_books
    when '4'
      puts "Returning \n\n"
    else
      puts "Please select the correct option \n"
      launch_books
    end
  end

  def launch_games
    puts "Welcome to the Game Section

        1. List of Games
        2. List of Authors
        3. Add a game
        4. Back to main menu

        Please select any one option: "
    input = gets.chomp
    case input
    when '1'
      list_games
      launch_games
    when '2'
      list_authors
      launch_games
    when '3'
      create_game
      launch_games
    when '4'
      puts "Returning \n\n"
    else
      puts "Please select the correct option \n"
      launch_games
    end
  end
end
