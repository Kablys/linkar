require_relative 'parser'

# Class for handling link and its parts
class Link
  def initialize(link)
    self.link = link
  end
  attr_reader :link, :parts
  def link=(link)
    result = Parser.parse_link link
    return unless result
    @link = link
    @parts = self.class.to_h(result)
  end

  def to_s
    "#{@link}"
  end

  def self.to_h(md) # Match_data object to hash
    [[:protocol, md[1]],
     [:subdomain, md[4]],
     [:top_level_domain, md[6]],
     [:filepath, md[7]]].to_h
  end
end
