require './modules/book_module'
require './preserve_data/save_data'
require './preserve_data/load_data'
require './item/book'

class App
  include BookModule

  def initialize
    @books = Load.new.load_book_data
    @authors = []
    @labels = []
    @genres = []
    @container = { books: @books }
  end

  def options
    puts "
    1 - List all book
    2 - List all genres
    3 - List all labels
    4 - List all authors
    5 - Add a book
    6 - Exit
    "
    puts 'Select an option'
    puts ''
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def select_input
    options

    user_input = gets.chomp.to_i

    case user_input
    when 1 then list_books
    when 2 then show_genres
    when 3 then list_labels
    when 4 then list_authors
    when 5 then create_book
    when 6
      json_write
      puts ''
      puts 'Goodbye'
      puts ''
      exit
    else
      puts "Wrong input!\n"
      select_input
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity

  def add_rel(item)
    @labels << item.label
    if item.instance_of?(Book)
      @authors << item.author
    elsif item.instance_of?(Album)
      @genres << item.genre
    end
  end

  def json_write
    @container.each do |key, val|
      preserve_data(key, val)
    end
  end

  def on_start
    @container.each_value do |val|
      val.each do |item|
        add_rel(item)
      end
    end
  end
end