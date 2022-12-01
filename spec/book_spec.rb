require_relative '../lib/book'
require_relative '../lib/label'
require 'date'

describe Book do
  before(:all) do
    @book1 = Book.new('New publisher', 'bad', Date.parse('2001-02-03'))
  end
  context 'when testing the book class' do
    it 'should create a new book when book class instantiated' do
      book = Book.new('New publisher', 'Good', '2022-09-09')
      expect(book.publisher).to eq 'New publisher'
      expect(book.cover_state).to eq 'Good'
      expect(book.publish_date).to eq '2022-09-09'
    end
  end

  it 'can_be_archived? should return false' do
    expect(@book1.can_be_archived?).to be true
  end
end
