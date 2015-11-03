require_relative 'organizer'

# Returns statistics about system
class Stats
  def self.book_num(org)
    org.bookmarks.size
  end
  def self.tag_num(org)
    org.tags.size
  end
end
