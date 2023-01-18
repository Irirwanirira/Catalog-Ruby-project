require_relative './item.rb'
require_relative './game.rb'
require_relative './author.rb'

class App
    attr_reader :listOfGames
    def initialize
        @appmsg = "Welcome to the Game Section
    
        1. List of Games
        2. List of Authors
        3. Add a game
        4. Back to main menu
        
        Please select any one option: "
        @listOfGames = []
        @listOfAuthors = []
    end
    
    def list_games
        @listOfGames.each_with_index do |game, index|
            print "#{index+1}: Multiplayer: #{game.multiplayer}, Last played On: #{game.last_played_at},\n Author First Name: #{game.author.first_name}, Author Last Name: #{game.author.last_name},\n Archived: #{game.archived}, Publication Date: #{game.published_date}\n\n"
        end
    end

    def list_authors
        puts "List of Authors: \n"
        @listOfAuthors.each_with_index do |author, index|
            print "#{index+1}: #{author.first_name} #{author.last_name}\n"
        end
    end

    def create_game(multiplayer, last_played_at, authorFirst, authorLast, archived, date)
        newauthor = Author.new(authorFirst, authorLast)
        newgame = Game.new(multiplayer, last_played_at, newauthor, archived, date)
        @listOfGames.push(newgame)
        @listOfAuthors.push(newauthor)

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
            print "Is this game multiplayer (Y/N): "
            multiplayer = gets.chomp
            print "When is the game last played at? (DD/MM/YYYY): "
            last_played_at = gets.chomp
            print "Game's author first name: "
            authorFirst = gets.chomp
            print "Game's author last name: "
            authorLast = gets.chomp
            print "Is this game archived (Y/N): "
            archived = gets.chomp
            print "Published date of the game (DD/MM/YYYY): "
            date = gets.chomp
            create_game(multiplayer, last_played_at, authorFirst, authorLast, archived, date)
            launch

        when '4'
          puts "Returning \n\n"
        end
    end
end

