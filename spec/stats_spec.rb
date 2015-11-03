require 'spec_helper'

describe Stats do
  describe '#Bookmark' do
    subject(:org) do
      Organizer.new
    end
    context 'get total number of bookmarks' do
      it do
        num = 5
        num.times {org.add_bookmarks Bookmark.new('www.test.com')}
        expect(Stats.book_num(org)).to eql 5
      end
      it 'Adding 1 bookmark increases value by 1' do
        num = 5
        num.times{org.add_bookmarks Bookmark.new('www.test.com')}
        expect{org.add_bookmarks Bookmark.new('www.test.com')}.to change{Stats.book_num(org)}.from(5).to(6)
      end
    end
    context 'get total number of tags' do
      it 'Adding 1 bookmark increases value by 1' do
        num = 3
        tags = %i(first second third forth)
        num.times do
          org.add_bookmarks Bookmark.new('test.com', 't', tags[num - 1])
        end
        expect{org.add_bookmarks Bookmark.new('test.com', 't', tags[num])}.to change{Stats.book_num(org)}.from(3).to(4)
      end
    end
    context 'get total number of bookmarks with same tag' do
    end
    context 'get total number of bookmarks from same domain' do
    end
  end
end
