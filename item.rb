class Item
  attr_accessor :source, :author, :label, :genre

  def initialize(date, author, source, label, archived: false)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = archived
  end

  def can_be_archived?
    diff = Time.now.year - @publish_date
    diff > 10
  end

  private :can_be_archived?

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
