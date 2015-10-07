require 'spec_helper'

describe Bookmark do
  before :all do
    @bookmark = Bookmark.new('www.example.com',
                             'Bookmark name',
                             %w(first example))
  end

  describe '#name' do
    it 'returns the name of bookmark' do
      expect(@bookmark.name).to eql 'Bookmark name'
    end
  end

  describe '#link' do
    it 'returns the bookmarks link' do
      expect(@bookmark.link).to eql 'www.example.com'
    end
  end

  describe '#tags' do
    it 'returns bookmarks array of tags' do
      expect(@bookmark.tags).to eql %w(first example)
    end
  end

  describe '#add_tag' do
    context 'something other thant single string supplied as a tag' do
      it 'does nothing' do
        @bookmark.add_tag :not_string
        expect(@bookmark.tags).to eql %w(first example)
      end
    end
    context 'one string is suplied as a tag' do
      it 'adds tag to tag array' do
        @bookmark.add_tag 'third'
        expect(@bookmark.tags).to eql %w(first example third)
      end
    end
  end

  describe '#del_tag' do
    context 'name of to tag to be deleted given' do
      it 'removes that tag' do
        @bookmark.del_tag :not_string
        expect(@bookmark.tags).to eql %w(first example third)
      end
    end
    context 'name of to tag to be deleted given' do
      it 'removes that tag' do
        @bookmark.del_tag 'third'
        expect(@bookmark.tags).to eql %w(first example)
      end
    end
  end

  describe '#rename_tag' do
    context 'gets two strings with names' do
      it 'renames tag (of first string name) with second string' do
        @bookmark.rename_tag 'first', 'uno'
        expect(@bookmark.tags).to eql %w(uno example)
      end
    end
  end

  describe '.num_of_bookmarks' do
    context 'there being only one bookmark object' do
      it 'returns 1' do
        expect(Bookmark.num_of_bookmarks).to eql 1
      end
    end
    context 'there being two bookmark object' do
      it 'returns 2' do
        Bookmark.new 'www.ruby-lang.org/', 'Ruby Language'
        expect(Bookmark.num_of_bookmarks).to eql 2
      end
    end
  end

  describe '#to_s' do
    it 'returns correctly formatted string' do
      expect(@bookmark.to_s).to eql 'Bookmark name -> www.example.com'
    end
  end
end
