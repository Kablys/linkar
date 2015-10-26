require 'spec_helper'

describe Parser do
  describe '.parse_link' do
    subject(:link_part) do
      Parser.parse_link('http://www.betterspecs.org/#subject')
    end
    context 'given correct link' do
      it 'it returns correct' do
        expect(link_part.to_a).to match_array(%w(http://www.betterspecs.org/#subject
                                               http:// www.
                                               betterspecs.org
                                               betterspecs.
                                               org
                                               /#subject))
      end
    end
    context 'given incorrect link' do
      it 'it returns nil' do
        bad_link = 'http:/www.betterspecs.org/#subject'
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
