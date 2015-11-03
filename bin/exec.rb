require 'rubygems'
require 'yaml'
require 'bundler/setup'

require_relative '../lib/organizer'
# mark = Bookmark.new('www.google.com', 'Google')
# @bookmark = Bookmark.new('www.example.com',
#                          'Bookmark name',
#                          %i(first example))
# @bookmark.add_tag :hai
# puts mark
# exit

org = Organizer.new
loop do
  puts '1. Add bookmark'
  puts '2. Remove bookmark'
  puts '3. Print bookmark'
  puts '4. Print tags'
  puts '5. Save bookmarks'
  puts '6. Load bookmarks'
  puts '7. Sort bookmarks'
  puts 'q. Exit program'

  command = gets.chomp
  case command
    when '1'
      puts 'link'
      link = gets
      puts 'name'
      name = gets
      puts 'list of tags (separated by \' \')'
      temp = gets
      temp = temp.scan(/\w+/)
      print temp.to_s + "\n"
      org.add_bookmarks(Bookmark.new(link.chomp!,name.chomp!,temp))
    when '2'
    when '3'
      org.bookmarks.each_with_index do |book, index|
        puts index.to_s + '. ' + book.to_s
      end
      puts
    when '4'
      puts org.tags
    when '5' # Save bookmarks
      File.open('data.yml', 'w') {|f| f.write(org.to_yaml)}
    when '6' # Load bookmarks
      org = begin
        YAML.load(File.open('data.yml', 'r'))
      rescue ArgumentError => e
        puts "Could not parse YAML: #{e.message}"
      end
    when '7'
    when 'q'
      puts 'Goodbye'
      exit
    else
      puts "Unknown command #{command}"
  end
end
