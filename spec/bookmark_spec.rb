require 'spec_helper'

describe Bookmark do
  before :all do
    @bookmark = Bookmark.new('www.example.com',
                             'Bookmark name',
                             %i(first example))
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

  #describe '#domain' do
  #  it 'returns the bookmarks domain' do
  #    expect(@bookmark.domain).to eql 'example.com'
  #  end
  #end

  #describe '#protocol' do
  #  it 'returns the bookmarks protocol' do
  #    expect(@bookmark.protocol).to be_nil
  #  end
  #end

  #describe '#top_domain' do
  #  it 'returns the bookmarks top level domain' do
  #    expect(@bookmark.top_domain).to eql 'com'
  #  end
  #end

  describe '.parse_link' do
    subject(:link_part) do
      Bookmark.parse_link('http://www.betterspecs.org/#subject')
    end
    context 'Given correct link' do
      it 'it returns correct' do
        # REVIEW: Kur galima newline naudoti
        # (po to galiu ideti kelis space, bet ne \n)
        expect(link_part.to_a).to match_array([
          'http://www.betterspecs.org/#subject',
          'http://',
          'www.',
          'betterspecs.org',
          'betterspecs.',
          'org',
          '/#subject'])
      end
    end
    # it { expect(link_part[1]).to eql('http://') }
    # it { expect(link_part[2]).to eql('www.') }
    # it { expect(link_part[3]).to eql('betterspecs.org') }
    # it { expect(link_part[4]).to eql('betterspecs.') }
    # it { expect(link_part[5]).to eql('org') }
    # it { expect(link_part[6]).to eql('/#subject') }
    context 'Given incorrect link' do
      it 'it returns nil' do
        # REVIEW: Kur galima newline naudoti
        # (po to galiu ideti kelis space, bet ne \n)
        bad_link = 'http:/www.betterspecs.org/#subject'
        expect(Bookmark.parse_link(bad_link)).to eql nil
      end
    end
  end

  describe '#tags' do
    it 'returns bookmarks array of tags' do
      expect(@bookmark.tags).to eql %i(first example)
    end
  end

  describe '#add_tag' do
    context 'something other thant single symbol supplied as a tag' do
      it 'does nothing' do
        @bookmark.add_tag 'not symbol'
        expect(@bookmark.tags).to eql %i(first example)
      end
    end
    context 'one symbol is suplied as a tag' do
      it 'adds tag to tag array' do
        @bookmark.add_tag :third
        expect(@bookmark.tags).to eql %i(first example third)
      end
    end
  end

  describe '#del_tag' do
    context 'name of non exsiting tag to be deleted given' do
      it 'removes that tag' do
        @bookmark.del_tag 'not symbol'
        expect(@bookmark.tags).to eql %i(first example third)
      end
    end
    context 'name of to tag to be deleted given' do
      it 'removes that tag' do
        @bookmark.del_tag :third
        expect(@bookmark.tags).to eql %i(first example)
      end
    end
  end

  describe '#rename_tag' do
    context 'gets two strings with names' do
      it 'renames tag (of first string name) with second string' do
        @bookmark.rename_tag :first, :uno
        expect(@bookmark.tags).to eql %i(uno example)
      end
    end
  end

  describe '#to_s' do
    it 'returns correctly formatted string' do
      expect(@bookmark.to_s).to eql 'Bookmark name -> www.example.com'
    end
  end
end
