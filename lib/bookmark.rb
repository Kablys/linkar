require_relative 'link'

# Class for handling Bookmarks
class Bookmark
  def initialize(link, name = '', tags = [])
    @link = Link.new(link)
    return unless @link
    # TODO: if no name is supplied use website title
    @name = name
    @tags = tags
  end

  def add_tag(tag)
    @tags << tag if tag.is_a? Symbol
  end

  def del_tag(name)
    @tags.delete(name) if name.is_a? Symbol
  end

  def rename_tag(name, new_name)
    return unless (new_name.is_a? Symbol) && (name.is_a? Symbol)
    index = @tags.index(name)
    @tags[index] = new_name
  end

  def to_s
    "#{@name} -> #{@link}"
  end
end
