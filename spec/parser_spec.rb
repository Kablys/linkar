require 'spec_helper'

describe Parser do
  before :each do
    @parse = Parser.new
  end
  describe '.parse_link' do
    context 'if empty link is given' do
      it 'returns nil'do
        expect(Parser.parse_link '').to be_nil
      end
    end
  end
end
