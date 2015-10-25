# Class for handling Bookmarks
class Bookmark
  def initialize(link, name = '', tags = [])
    # REVIEW: @link = link ?
    # REVIEW: How to make if return nil
    self.link = link
    return unless @link
    # TODO: if no name is supplied use website title
    @name = name
    #@time = Time.now # same as Time.new
    @tags = tags
  end

  def link=(link)
    result = self.class.parse_link link
    return unless result
    @link_parts = [result[1], result[2], result[4], result[5], result[6]]
    # @protocol = result[1]
    # @domain = result[3]
    # @top_domain = result[5]
    @link = link
    #  REVIEW: What is an adventage of guard clause
    # if result
    #   @protocol = result[1]
    #   @domain = result[3]
    #   @top_domain = result[5]
    #   @link = link
    # end
  end

  def self.parse_link(link)
    %r{\A([a-z]+:\/\/)?    #protocol
      (www\.)?
      (                 #domain name
        ([a-z0-9-]+\.)+ #subdomain
        ([a-zA-Z]+))    #top level domain
      (\/.*)?\z #filepath
    }x.match(link)
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
    # TODO: testing time
    # "#{@name} -> #{@link} at: #{@time.inspect}"
  end
end
