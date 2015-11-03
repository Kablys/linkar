require 'spec_helper'

describe Link do
  describe '#link=' do
    subject(:good_link) do
      Link.new('http://www.betterspecs.org/#subject')
    end
    context 'given correct link' do
      it 'it returns correct' do
        expect(good_link.link).to eql 'http://www.betterspecs.org/#subject'
      end
      it 'it gets correct link parts' do
        expect(good_link.parts).to match_array(protocol: 'http://',
                                              subdomain: 'betterspecs.',
                                              top_level_domain: 'org',
                                              filepath: '/#subject')
      end
    end
  end
end
