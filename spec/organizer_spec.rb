require 'spec_helper'

describe Organizer do
  describe '#add_bookmarks' do
    let(:test_book) {test_book = Bookmark.new('test.com', 'test', [:first])}
    subject(:organ) do 
      Organizer.new
    end
    context 'supply not organized bookmark' do
      it 'adds bookmark to array' do
        organ.add_bookmarks(test_book)
        expect(organ.get_bookmarks).to eql [test_book]
      end
      it 'adds bookmark to array' do
        organ.add_bookmarks(test_book)
        # REVIEW: expect(organ.get_tags).to eql ({:first => [test_book]})
        expect(organ.get_tags).to include ({first: [test_book]})
      end
    end
    context 'add already existing bookmark' do
    end
  end

  describe '#remove_bookmarks' do
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

  describe '#get_bookmarks' do
    context 'get single bookmark by name' do
    end
    context 'get all bookmars with same tag' do
    end
    context 'get all bookmars with from same domain' do
    end
  end

  # TODO move to different class
  describe '#get_stats' do
    context 'get total number of bookmarks' do
    end
    context 'get total number of tags' do
    end
    context 'get total number of bookmarks with same tag' do
    end
    context 'get total number of bookmarks from same domain' do
    end
  end
end
