require_relative 'organizer'

# Returns statistics about system
class Stats
  def self.book_num(org)
    org.bookmarks.size
  end

  def self.tag_num(org, tag = nil)
    tags = org.tags
    return tags.size unless tag
    tags[tag].size
  end
end
