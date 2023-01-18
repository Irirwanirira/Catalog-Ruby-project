require_relative './item'
require_relative './game'
require_relative './author'
require_relative './json_read_write'

class App
  attr_reader :listofgames

  def initialize
    @appmsg = "Welcome to the Game Section

        1. List of Games
        2. List of Authors
        3. Add a game
        4. Back to main menu

        Please select any one option: "
    @listofgames = []
    @listofauthors = []
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
    print 'Is this game archived (Y/N): '
    archived = gets.chomp
    print 'Published date of the game (DD/MM/YYYY): '
    date = gets.chomp
    print "\n Game Created Successfully \n"
    newauthor = Author.new(author_first, author_last)
    newgame = Game.new(multiplayer, last_played_at, newauthor, archived, date)
    @listofgames.push(newgame)
    @listofauthors.push(newauthor)
    savegame_json(@listofgames)
    saveauthor_json(@listofauthors)
  end

  def launch
    puts @appmsg
    input = gets.chomp
    case input
    when '1'
      list_games
      launch
    when '2'
      list_authors
      launch
    when '3'
      create_game
      launch
    when '4'
      puts "Returning \n\n"
    else
      puts "Please select the correct option \n"
      launch
    end
  end
end
