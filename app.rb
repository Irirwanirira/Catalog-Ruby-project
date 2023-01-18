require_relative './item.rb'
require_relative './game.rb'
require_relative './author.rb'

class App
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
        @listOfGames.each do |game|
            p "#{game}"
        end
    end

    def list_authors
        @listOfAuthors.each do |author|
            p "#{author}"
        end
    end

    def create_game(multiplayer, last_played_at, author, archived, date)
        newgame = Game.new(multiplayer, last_played_at, author, archived, date)
        @listOfGames.push(newgame)
        
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
            print "Author of the game: "
            author = gets.chomp
            print "Is this game archived (Y/N): "
            archived = gets.chomp
            print "Published date of the game (DD/MM/YYYY): "
            date = gets.chomp
            create_game(multiplayer, last_played_at, author, archived, date)

        when '4'
          puts "Returning \n\n"
        end
    end
end
