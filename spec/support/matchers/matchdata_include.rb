require 'rspec/expectations'

# Matcher substitutes
# expect(link_part.to_a).to match_array(%w(http://www.betterspecs.org/#subject
#                                                  http://
#                                                  www.
#                                                  betterspecs.org
#                                                  betterspecs.
#                                                  betterspecs.
#                                                  org
#                                                  /#subject))
RSpec::Matchers.define :matchdata_include do |expected|
  match do |actual|
    expected.each_key do |key, value|
      if key == -1
        actual.pre_match == value
      elsif key == actual.size
        actual.post_match == value
      else
        actual[key] == value
      end
    end
  end
end
