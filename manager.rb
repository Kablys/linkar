require "./bookmark.rb"
mark = Bookmark.new('www.google.com', 'Google')
barray = []
barray.push Bookmark.new('www.com.com', 'dude')
barray.push mark
barray.each { |l| puts l }
