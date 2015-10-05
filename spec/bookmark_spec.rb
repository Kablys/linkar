require 'spec_helper'

describe Bookmark do
  before :each do
    @bookmark = Bookmark.new 'www.example.com', 'Website title'
  end
  describe '#new' do
    it 'takes 2 parameters and returns a Bookmark object' do
      expect(@bookmark).to be_an_instance_of Bookmark
    end
  end
  describe '#name' do
    it 'returns the correct name' do
      expect(@bookmark.name).to eql 'Website title'
    end
  end
  describe '#link' do
    it 'returns the correct link' do
      expect(@bookmark.link).to eql 'www.example.com'
    end
  end
end
