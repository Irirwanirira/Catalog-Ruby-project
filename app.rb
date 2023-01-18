
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
    


    def launch
        puts @appmsg
        input = gets.chomp 
        case input
        when '1'
          puts "1 input is pressed"
          launch
        when '2'
          puts "2 input is pressed"
          launch
        when '4'
          puts "Returning \n\n"
        end
    end
end
