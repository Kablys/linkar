require_relative 'bookmark'
require 'yaml'

# Class responsible for organizing bookmarks
class Organizer
  def initialize
    @book_arr = []
    @tag_hash = Hash.new([])
  end

  def add_bookmarks(bookmark)
    puts 'reached bookmark limit' unless @book_arr.size < 100
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
    else
      $stderr.puts "Wrong argument #{bookmark}"
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

  def export(file_path)
    File.open(file_path, 'w') { |file| file.write(to_yaml) }
  end

  def self.import(file_path)
    YAML.load(File.open(file_path, 'r'))
  end
end
