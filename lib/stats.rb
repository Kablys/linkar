require_relative 'organizer'

# Returns statistics about system
class Stats
  def self.book_num(org)
    org.bookmarks.size
  end
end
