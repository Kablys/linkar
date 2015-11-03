require 'rspec/expectations'

# Matcher substitutes
# expect(arr.find {|tag| tag.tags.include?(:first)}).to be_nil
RSpec::Matchers.define :include_tag do |expected|
  match do |actual|
    actual.find { |bookmark| bookmark.tags.include?(expected) }
  end
end
