# Class for handling Bookmarks
class Bookmark
  @num_of_bookmarks = 0 # should interact with Stat
  def initialize(link, name)
    @link = link
    @name = name
    @time = Time.now # same as Time.new
  end

  # REVIEW: class instance variable

  def self.new(link, name)
    @num_of_bookmarks += 1
    super
  end

  class << self
    attr_reader :num_of_bookmarks
  end

  #  def self.num_of_bookmarks
  #    @num_of_bookmarks
  #  end

  attr_accessor :name, :link
  attr_reader :time
  def to_s
    "#{@name} -> #{@link} at: #{@time.inspect}"
  end
end
