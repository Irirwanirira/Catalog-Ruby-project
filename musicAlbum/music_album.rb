require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :published_date

  def initialize(on_spotify, author, label, published_date)
    super(author, label, published_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    true if super() && @on_spotify
  end
end
