require_relative '../book/book'
require 'date'

describe Book do
  before :each do
    @book = Book.new('Ithaki', 'bad', 'Joseph', 'Irirwana', '2010-01-10')
    @book2 = Book.new('Gatsby', 'good', 'Samuel', 'Moiwa', '2020-01-10')
  end
  it 'return item' do
    @book.should be_an_instance_of Book
  end

  it 'return the state' do
    expect(@book.cover_state).to eq('bad')
  end

  it 'return publsh date' do
    expect(@book.published_date).to eq('2010-01-10')
  end

  it 'should return true if parents method returns true OR if cover_state equals to bad' do
    expect(@book.can_be_archived).to eql(true)
  end

  it 'should return false if parents method returns false AND if cover_state not equals to bad' do
    expect(@book2.can_be_archived).to eql(false)
  end
end
