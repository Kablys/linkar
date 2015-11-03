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
        expect { object.action }.to change(object, :value).from(old).to(new)
      end
      it 'increase by one' do
      #  expect { object.action }.to change(object, :value).from(old).to(new)
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
