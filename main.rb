require_relative './app'
require_relative './musicAlbum/music_data'

@console = App.new
read_musics

def our_recipe
  puts ''
  print 'Welcome to our studio, free to grab your dessert:'
  puts ''
  puts '
  1. Music
  2. Book
  3. Games
  4.Exit
  Choose (1-4)'
end

def user_choice
  gets.chomp.to_i
end

def match_input(selection)
  case selection
  when 1
    @console.music
  when 4
    puts 'Thank you for the visit!!'
    exit!
  else
    puts 'Not a valid selection'
  end
end

def main(status)
  loop do
    break unless status
    our_recipe
    user_input = user_choice
    match_input(user_input)
  end
end

main(true)
