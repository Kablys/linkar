# Class for handling Bookmarks
class Bookmark
  def initialize(link, name = '', tags = [])
    # REVIEW: @link = link ?
    # REVIEW: How to make if return nil
    self.link = link
    return unless @link
    # TODO: if no name is supplied use website title
    @name = name
    @time = Time.now # same as Time.new
    @tags = tags
  end

  def link=(link)
    result = parse_link link
    return unless result
    @protocol = result[1]
    @domain = result[3]
    @top_domain = result[5]
    @link = link
    #  REVIEW: What is an adventage of guard clause
    # if result
    #   @protocol = result[1]
    #   @domain = result[3]
    #   @top_domain = result[5]
    #   @link = link
    # end
  end

  def parse_link(link)
    %r{\A([a-z]+:\/\/)?    #protocol
      (www\.)?
      (                 #domain name
        ([a-z0-9-]+\.)+ #subdomain
        ([a-zA-Z]+))    #top level domain
      (\/.*)?\z #filepath
    }x.match(link)
  end

  attr_accessor :name
  attr_reader :time, :tags, :link, :protocol, :domain, :top_domain

  def add_tag(tag)
    @tags << tag if tag.is_a? Symbol
  end

  def del_tag(name)
    @tags.delete(name) if name.is_a? Symbol
  end

  def rename_tag(name, new_name)
    return unless (name.is_a? Symbol) && (name.is_a? Symbol)
    index = @tags.index(name)
    @tags[index] = new_name
  end

  def to_s
    "#{@name} -> #{@link}"
    # TODO: testing time
    # "#{@name} -> #{@link} at: #{@time.inspect}"
  end
end
