require_relative './app'

class Main
  def initialize(message, app)
    @msg = message
    @app = app
  end

  def launch
    puts @msg
    print 'Please select any one option: '
    option = gets.chomp
    case option
    when '2'
      @app.launch_books
      launch

    when '3'
      @app.launch_games
      launch

    when '4'
      puts 'Exiting...'
      exit

    else
      puts "Please select the correct option \n"
      launch

    end
  end
end

def main
  msg = "Welcome to the App

    1. Movies
    2. Books
    3. Games
    4. Exiting \n\n"

  app = App.new
  Main.new(msg, app).launch
end

main
