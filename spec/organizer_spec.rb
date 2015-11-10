require 'spec_helper'

describe Organizer do
  subject(:org) do
    Organizer.new
  end

  describe '#add_bookmarks' do
    let(:test_book) { Bookmark.new('test.com', 'test', [:first]) }
    context 'supply not organized bookmark' do
      it 'adds bookmark to array' do
        org.add_bookmarks(test_book)
        expect(org.bookmarks).to eql [test_book]
      end
      it 'adds bookmark to tag hash' do
        org.add_bookmarks(test_book)
        expect(org.tags).to include(first: [test_book])
      end
    end
    context 'add already existing bookmark' do
    end
  end

  describe '#remove_bookmark' do
    let(:test_book) { Bookmark.new('test.com', 'test', [:first]) }
    context 'if existing bookmark is given' do
      it do
        org.add_bookmarks(Bookmark.new(''))
        org.add_bookmarks(test_book)
        org.remove_bookmark(test_book)
        expect(org.bookmarks).not_to include(test_book)
      end
    end
    context 'if not existing bookmark given' do
      it do
        org.add_bookmarks(test_book)
        expect(org.remove_bookmark(Bookmark.new(''))).to be_nil
      end
    end
  end

  describe '#remove_tags' do
    let(:test_book) { Bookmark.new('test.com', 'test', [:first]) }
    let(:test_book2) { Bookmark.new('test2.com', 'test2', [:second]) }
    context 'if existing tag is given' do
      it 'update bookmark information' do
        org.add_bookmarks(test_book2)
        org.add_bookmarks(test_book)
        arr = org.tags[:first] # Save all tag-key values
        org.remove_tag(:first)
        # matcher change
        expect(arr).not_to include_tag(:first)
      end
      it 'update tag information' do
        org.add_bookmarks(test_book2)
        org.add_bookmarks(test_book)
        org.remove_tag(:first)
        # matcher change
        expect(org.tags).not_to include(:first)
      end
    end
    context 'if not existing tag given' do
      it do
        org.add_bookmarks(test_book)
        expect(org.remove_tag(Bookmark.new(''))).to be_nil
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
        expect { org.bookmarks arg }.to output(output).to_stderr
      end
    end
  end

  describe '#export' do
    test_link = 'spec/support/files/test.yml'
    export_link = 'spec/support/files/export_test.yml'

    before do
      org.add_bookmarks Bookmark.new('to.test', 'YAML', [:export, :yaml])
      org.add_bookmarks Bookmark.new('ruby.org', 'Ruby', [:ruby, :org])
    end
    it 'exports file' do
      org.export(export_link)
      expect(IO.read(export_link)).to eql IO.read(test_link)
    end
  end

  describe '.import' do
    test_link = 'spec/support/files/test.yml'
    before do
      org.add_bookmarks Bookmark.new('to.test', 'YAML', [:export, :yaml])
      org.add_bookmarks Bookmark.new('ruby.org', 'Ruby', [:ruby, :org])
    end
    context 'given correct file path' do
      it do
        expect(Organizer.import(test_link).to_yaml).to eql org.to_yaml
      end
    end

    # context 'given incorrect file path' do
    #   it do
    #     corrupt_link = 'spec/support/files/corrupt_test.yml'
    #     expect{org = Organizer.import(corrupt_link)}.to raise_error
    #     print org
    #   end
    # end
  end
end
