# Class for handling Bookmarks
class Bookmark
  def initialize(link, name = '', tags = [])
    @link = (link)
    if @link
      # TODO: if no name is supplied use website title
      @name = name
      @time = Time.now # same as Time.new
      @tags = tags
    end
  end

  attr_accessor :name
  attr_reader :time, :tags, :link, :protocol, :domain, :top_domain

  def link= (link)
    if result = self.class.parse_link(link)
      @protocol = result[1]
      @domain = result[3]
      @top_domain = result[5]
      return @link = link
    else
      return  nil
    end
  end

  def self.parse_link (link)
    /^([a-z]+:\/\/)?    #protocol
      (www\.)?          #www
      (([a-z0-9-]+\.)+([a-zA-Z]+)) #domain
      (\/.*)?$ #filepath
    /x.match(link) #option x allows to use whitespace in regexp
  end

  def add_tag(tag)
    @tags << tag if tag.is_a? String
  end

  def del_tag(name)
    @tags.delete(name) if name.is_a? String
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
