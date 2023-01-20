require 'date'

class Item
  attr_accessor :author, :publish_date
  attr_reader :label, :genre

  def initialize(author, label, published_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @label = label
    @author = author
    @archived = false
    @published_date = published_date
  end

  # private :can_be_archived

  def can_be_archived
    diff = Date.today - Date.parse(@published_date)
    diff.to_i > 3652
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
