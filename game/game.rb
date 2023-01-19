require_relative '../item'
require 'date'

class Game < Item
  alias parent_can_be_archived can_be_archived

  def initialize(multiplayer, last_played_at, author, label, published_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(author, label, published_date)
  end
  attr_reader :last_played_at, :multiplayer, :archived, :published_date, :label

  def can_be_archived
    diff = Date.today - Date.parse(@last_played_at)
    diff > 730 && parent_can_be_archived
  end
end
