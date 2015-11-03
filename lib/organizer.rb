require_relative 'bookmark'

# Class responsible for organizing bookmarks
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

  def remove_bookmark(bookmark)
    return unless @book_arr.delete(bookmark)
    bookmark.tags.each do |tag|
      @tag_hash[tag] = @tag_hash[tag] - [bookmark]
    end
  end

  def bookmarks(bookmark = '')
    case bookmark
    when ''
      @book_arr
    when Fixnum
      @book_arr[bookmark]
    when Symbol # Return array of values
      @tag_hash[bookmark]
    # REVIEW: What's the point
    # when Bookmark
    #   @book_arr[@book_arr.index(bookmark)]
    else
      puts "Wrong argument #{bookmark}"
    end
  end

  def tags
    @tag_hash
  end

  # Use Bookmark array index
  # Range
  # Int
  def add_tag
  end

  def remove_tag(tag)
    return unless @tag_hash.delete(tag)
    @book_arr.each do |bookmark|
      bookmark.del_tag(tag)
    end
  end
end
