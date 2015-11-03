require_relative 'link'

# Class for handling Bookmarks
class Bookmark
  def initialize(link, name = '', tags = [])
    @link = Link.new(link)
    return unless @link
    # TOD
    # O: if no name is supplied use website title
    self.name = name
    @tags = tags
  end
  attr_reader :tags, :link, :name
  def add_tag(tag)
    @tags << tag if tag.is_a? Symbol
  end

  def name=(name)
    return '' unless name.ascii_only?
    @name = name
  end

  def del_tag(name)
    @tags.delete(name) if name.is_a? Symbol
  end

  def rename_tag(name, new_name)
    return unless (new_name.is_a? Symbol) && (name.is_a? Symbol)
    index = @tags.index(name)
    @tags[index] = new_name
  end

  def link
    @link.to_s
  end

  def to_s
    "#{@name} #{@link}"
  end
end
