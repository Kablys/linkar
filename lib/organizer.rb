require 'bookmark'

# Class resposnbile for organizing bookmarks
class Organizer
  def initialize
    @book_arr = []
    @tag_hash = Hash.new([])
  end

  def add_bookmarks(bookmark)
    @book_arr << bookmark
    bookmark.tags.each do |tag|
      @tag_hash[tag] = @tag_hash[tag] << @book_arr.last
    end
  end

  def get_bookmarks(bookmark = nil)
    case bookmark
    when nil
      @book_arr
    when String
      @book_arr[@book_arr.index(bookmark)]
    end
  end

  def remove_bookmarks
  end

  def add_tag
  end

  def get_tags
    @tag_hash
  end

  def remove_tag
  end

  def get_stats
  end
end
