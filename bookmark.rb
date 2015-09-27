class Bookmark
  def initialize(link, name)
    @link = link
    @name = name
    @time = Time.now # same as Time.new
  end

  attr_accessor :name, :link

  def to_s
    "#@name -> #@link at: #@time.inspect"
  end
end

mark = Bookmark.new('www.google.com', 'Google')

barray = []
barray.push Bookmark.new('www.com.com', 'dude')
barray.push mark
barray.each { |l| puts l }
