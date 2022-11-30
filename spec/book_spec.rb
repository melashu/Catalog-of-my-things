require_relative '../lib/book'
require 'date'

describe Book do
  context 'when testing the book class' do
    it 'should create a new book when book class instantiated' do
      book = Book.new('New publisher', 'Good', '2022-09-09')
      expect(book.publisher).to eq 'New publisher'
      expect(book.cover_state).to eq 'Good'
      expect(book.publish_date).to eq '2022-09-09'
    end
  end
end
