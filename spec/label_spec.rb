require_relative '../lib/label'
require_relative '../lib/book'

describe Label do
  context 'when testing the label class' do
    it 'should create a new label when label class instantiated' do
      label = Label.new('12 Rules of life', 'Red')
      expect(label.title).to eq '12 Rules of life'
      expect(label.color).to eq 'Red'
    end
  end

  context 'when testeing number of books in label class' do
    it 'should return number of books to be one' do
      book = Book.new('New publisher', 'Good', '2022-09-09')
      label = Label.new('12 Rules of life', 'Red')
      label.add_item(book)
      expect(label.items.length).to eq 1
    end
  end
end
