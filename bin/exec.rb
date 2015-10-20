require 'rubygems'
require 'bundler/setup'

require_relative '../lib/bookmark'
mark = Bookmark.new('www.google.com', 'Google')
puts mark.link
# barray = []
# barray.push Bookmark.new('www.com.com', 'dude')
# barray.push mark
# barray.each { |l| puts l }
