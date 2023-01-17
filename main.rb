require_relative './app'
# require_relative './read_data'
# require_relative './save_data'
@console = App.new
# read_data

def our_recipe
  puts ''
  print 'Welcome in our studio, free to grab your dessert:'
  puts ''
  puts '
  1. Music
  5.Exit
  Choose (1-4)'
end

def user_choice
  gets.chomp.to_i
end

def match_input(selection)
  case selection
  when 1
    @console.music
  when 2
    puts 'Thank you for the visit!!'
    save_data
    exit!
  else
    puts 'Not a valid selection'
  end
end

def main(status)
  loop do
    break unless status
    
    user_input = user_choice
    match_input(user_input)
    our_recipe
  end
end

main(true)
