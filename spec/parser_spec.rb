require 'spec_helper'

describe Parser do
  describe '.parse_link' do
    subject(:link_part) do
      Parser.parse_link('http://www.betterspecs.org/#subject')
    end
    context 'given correct link' do
      it 'it returns correct' do
        expect(link_part).to matchdata_include('http://www.betterspecs.org/#subject',
                                               'http://',
                                               'www.',
                                               'betterspecs.org',
                                               'betterspecs.',
                                               'betterspecs.',
                                               'org',
                                               '/#subject')
      end
    end
    context 'given incorrect link' do
      it 'if bad protocol it returns nil' do
        bad_link = 'http:/www.betterspecs.org/#subject' # missing 1 / from //
        expect(Parser.parse_link(bad_link)).to be_nil
      end
      it 'if wrong char in domain it returns nil' do
        bad_link = 'http://www.better_specs.org/#subject'
        expect(Parser.parse_link(bad_link)).to be_nil
      end
      it 'if wrong char in top level domain it returns nil' do
        bad_link = 'http://www.betterspecs.org9/#subject'
        expect(Parser.parse_link(bad_link)).to be_nil
      end
      it 'if whitespace at start of link it returns nil' do
        bad_link = ' http://www.betterspecs.org/#subject'
        expect(Parser.parse_link(bad_link)).to be_nil
      end
      it 'if whitespace at end of link it returns nil' do
        bad_link = 'http://www.betterspecs.org/#subject '
        expect(Parser.parse_link(bad_link)).to be_nil
      end
      it 'if dot at end of link it returns nil' do
        bad_link = 'http://www.betterspecs.'
        expect(Parser.parse_link(bad_link)).to be_nil
      end
      it 'if just letters it returns nil' do
        bad_link = 'betterspecs'
        expect(Parser.parse_link(bad_link)).to be_nil
      end
      it 'if email address it returns nil' do
        bad_link = 'test@betterspecs.com'
        expect(Parser.parse_link(bad_link)).to be_nil
      end
    end
    context 'given empty link is given' do
      it 'returns nil'do
        expect(Parser.parse_link '').to be_nil
      end
    end
  end
end
