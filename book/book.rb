require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :published_date

  attr_reader :type, :label

  def initialize(publisher, cover_state, author, label, published_date)
    super(author, label, published_date)
    @publisher = publisher
    @cover_state = cover_state
    @type = 'Book'
  end

  def can_be_archived
    age = Date.today - Date.parse(@published_date)
    age > 3652 || @cover_state == 'bad'
  end
end
