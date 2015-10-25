require_relative 'parser'

# Class for handling link and its parts
class Link
  def initialize(link)
    self.link = link

  end

  def link=(link)
    @link_parts = Parser.parse_link link
    return unless @link_parts
    @link = link
  end

  def to_s
    "#{@link}"
  end
end