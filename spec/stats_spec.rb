require 'spec_helper'

describe Stats do
  subject(:org) do
    Organizer.new
  end

  describe '.book_num' do
    context 'get total number of bookmarks' do
      it do
        num = 5
        num.times { org.add_bookmarks Bookmark.new('www.test.com') }
        expect(Stats.book_num(org)).to eql 5
      end
      it 'Adding 1 bookmark increases value by 1' do
        num = 5
        num.times { org.add_bookmarks Bookmark.new('www.test.com') }
        expect do
          org.add_bookmarks Bookmark.new('www.test.com')
        end.to change { Stats.book_num(org) }.from(5).to(6)
      end
    end
  end
  describe '.tag_num' do
    context 'get total number of tags' do
      it 'Adding 1 bookmark increases value by 1' do
        num = 3
        tags = %i(first second third)
        num.times do |n|
          org.add_bookmarks Bookmark.new('test.com', 't', [tags[n]])
        end
        proc = -> { org.add_bookmarks Bookmark.new('test.com', 't', [:test]) }
        expect(&proc).to change { Stats.tag_num(org) }.from(3).to(4)
      end
    end
    context 'get total number of bookmarks with same tag' do
      it do
        num = 3
        num.times do |n|
          org.add_bookmarks Bookmark.new("test#{n}.com", "t#{n}", [:test])
        end
        expect(Stats.tag_num(org, :test)).to eql 3
      end
    end
    context 'get total number of bookmarks from same domain' do
    end
  end
end
