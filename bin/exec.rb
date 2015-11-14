require 'rubygems'

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
  # puts '2. Remove bookmark'
  puts '3. Print bookmark'
  puts '4. Print tags'
  puts '5. Save bookmarks'
  puts '6. Load bookmarks'
  # puts '7. Sort bookmarks'
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
    #Converts string into array of one word strings and then to array of symbols
    temp = temp.scan(/\w+/).map{ |word| word.to_sym }
    print temp.to_s + "\n"
    org.add_bookmarks(Bookmark.new(link.chomp!,name.chomp!,temp))
  # when '2'
  when '3'
    org.bookmarks.each_with_index do |book, index|
      puts index.to_s + '. ' + book.to_s
    end
    puts
  when '4'
    puts org.tags
  when '5' # Save bookmarks
    org.export('data.yml')
  when '6' # Load bookmarks
    org = Organizer.import('data.yml')
      # REVIEW add exeptcion
  #when '7' # Sort bookmarks
  when 'q'
    puts 'Goodbye'
    exit
  else
    puts "Unknown command #{command}"
  end
end
