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
RSpec::Matchers.define :matchData_include do |*expected|
  match do |actual|
    actual.to_a == (expected)
  end
end
