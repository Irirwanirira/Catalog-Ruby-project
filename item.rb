require 'date'

class Item
  attr_reader :author, :label

  def initialize(author, label, published_date)
    @id = Random.rand(1..1000)
    @label = label
    @author = author
    @archived = false
    @published_date = published_date
  end

  def can_be_archived
    diff = Date.today - Date.parse(@published_date)
    diff.to_i > 3652
  end

  def add_author(author)
    @author = author
  end
end
