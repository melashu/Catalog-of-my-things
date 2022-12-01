require_relative '../lib/author'
require 'date'

describe Author do
  context 'when the author is created' do
    it 'returns the first name and last name' do
      author = Author.new('John', 'Doe')
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end
  end
end
