require 'spec_helper'

describe Stats do
  describe '#Bookmark' do
    subject(:org) do
      Organizer.new
    end
    context 'get total number of bookmarks' do
      it 'increase by one' do
        num = 5
        num.times {org.add_bookmarks Bookmark.new('www.test.com')}
        expect { Stats(org).book_num }.to eql 5
      end
      it 'increase by one' do
        num = 5
        num.times {org.add_bookmarks Bookmark.new('www.test.com')}
        expect { org.add_bookmarks Bookmark.new('www.test.com') }.to change(Stats(org).book_num).from(5).to(6)
      end
    end
    context 'get total number of tags' do
    end
    context 'get total number of bookmarks with same tag' do
    end
    context 'get total number of bookmarks from same domain' do
    end
  end
end
