# Class for handling Bookmarks
class Bookmark
  @num_of_bookmarks = 0 # should interact with Stat
  def initialize(link, name = '', tags = [])
    # TODO: link validation
    @link = link
    # TODO: if no name is supplied use website title
    @name = name
    @time = Time.now # same as Time.new
    @tags = tags
  end

  # REVIEW: is this proper class instance variable implementation

  def self.new(link, name = '', tags = [])
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
  attr_reader :time, :tags

  def add_tag(tag)
    @tags << tag if tag.is_a? String
  end

  def del_tag(name)
    @tags.delete(name)
  end

  def rename_tag(name, new_name)
    if (name.is_a? String) && (name.is_a? String)
      index = @tags.index(name)
      @tags[index] = new_name
    else
      return
    end
  end

  def to_s
    "#{@name} -> #{@link}"
    # TODO: testing time
    # "#{@name} -> #{@link} at: #{@time.inspect}"
  end
end
