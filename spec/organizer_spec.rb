require 'spec_helper'

describe Organizer do
  describe '#add_bookmarks' do
    let(:test_book) { Bookmark.new('test.com', 'test', [:first]) }
    subject(:organ) do
      Organizer.new
    end
    context 'supply not organized bookmark' do
      it 'adds bookmark to array' do
        organ.add_bookmarks(test_book)
        expect(organ.bookmarks).to eql [test_book]
      end
      it 'adds bookmark to tag hash' do
        organ.add_bookmarks(test_book)
        expect(organ.tags).to include(first: [test_book])
      end
    end
    context 'add already existing bookmark' do
    end
  end

  describe '#remove_bookmark' do
    let(:test_book) { Bookmark.new('test.com', 'test', [:first]) }
    subject(:organ) do
      Organizer.new
    end
    context 'if existing bookmark is given' do
      it do
        organ.add_bookmarks(Bookmark.new(''))
        organ.add_bookmarks(test_book)
        organ.remove_bookmark(test_book)
        expect(organ.bookmarks).not_to include(test_book)
      end
    end
    context 'if not existing bookmark given' do
      it do
        organ.add_bookmarks(test_book)
        expect(organ.remove_bookmark(Bookmark.new(''))).to be_nil
      end
    end
  end

  describe '#remove_tags' do
    let(:test_book) { Bookmark.new('test.com', 'test', [:first]) }
    let(:test_book2) { Bookmark.new('test2.com', 'test2', [:second]) }
    subject(:organ) do
      Organizer.new
    end
    context 'if existing tag is given' do
      it 'update bookmark information' do
        organ.add_bookmarks(test_book2)
        organ.add_bookmarks(test_book)
        arr = organ.tags[:first] # Save all tag-key values
        organ.remove_tag(:first)
        # matcher change
        expect(arr).not_to include_tag(:first)
      end
      it 'update tag information' do
        organ.add_bookmarks(test_book2)
        organ.add_bookmarks(test_book)
        organ.remove_tag(:first)
        # matcher change
        expect(organ.tags).not_to include(:first)
      end
    end
    context 'if not existing tag given' do
      it do
        organ.add_bookmarks(test_book)
        expect(organ.remove_tag(Bookmark.new(''))).to be_nil
      end
    end
  end

  describe '#add_tag' do
    context 'add one tag to one bookmark' do
    end
    context 'add multiple tags to multiple bookmarks' do
    end
    context 'try to add already existing tag' do
    end
  end

  describe '#remove_tag' do
  end

  describe '#bookmarks' do
    let(:test_book) { Bookmark.new('test.com', 'test', [:first]) }
    let(:test_book2) { Bookmark.new('test2.com', 'test2', [:second]) }
    subject(:org) do
      Organizer.new
    end
    context 'get all bookmarks' do
      it do
        org.add_bookmarks test_book
        org.add_bookmarks test_book2
        expect(org.bookmarks).to eql [test_book, test_book2]
      end
    end
    context 'get bookmark by index' do
      it do
        num = 5
        num.times do |n|
          org.add_bookmarks Bookmark.new("temp#{n}.com", "temp#{n}", [:temp])
        end
        org.add_bookmarks test_book
        expect(org.bookmarks num).to eql(test_book)
      end
    end
    context 'get all bookmarks with same tag' do
      it do
        org.add_bookmarks test_book
        expect(org.bookmarks :first).to eql [test_book]
      end
    end
    context 'given wrong argument' do
      it do
        arg = ['bad']
        output = "Wrong argument #{arg}\n" # to fit 80 char limit
        expect { org.bookmarks arg }.to output(output).to_stdout
      end
    end
  end
end
