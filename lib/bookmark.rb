class Bookmark
    @@numOfLinks = 0 # should interact with Stat
  def initialize(link, name)
    @link = link
    @name = name
    @time = Time.now  # same as Time.new
    @@numOfLinks += 1 # should interact with Stat
  end

  attr_accessor :name, :link
  attr_reader :numOfLinks, :time
  def to_s
    "#{@name} -> #{@link} at: #{@time.inspect}"
  end
end
