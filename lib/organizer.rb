require_relative 'bookmark'

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

  def bookmarks(bookmark = '')
    case bookmark
    when ''
      @book_arr
    when String
      @book_arr[@book_arr.index(bookmark)]
    end
  end

  def remove_bookmarks
  end

  def add_tag
  end

  def tags
    @tag_hash
  end

  def remove_tag
  end

  def stats
  end
end
