class Item
  attr_accessor :author, :genre, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = ""
    @author = nil
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    diff = Time.now.year - @publish_date
    diff > 10
  end

  private :can_be_archived?

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
