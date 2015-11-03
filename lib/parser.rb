# Class resposible for parsing websites and bookmark export files
class Parser
  def self.parse_link(link)
    %r{\A([a-z]+:\/\/)?   #protocol
      (www\.)?
      (                   #domain name
        (([a-z0-9-]+\.)+) #subdomain
        ([a-zA-Z]+))      #top level domain
      (\/.*)?\z #filepath
    }x.match(link)
  end
  # def self.parse_title(website)
  # end
  # def self.parse_bookmarks(website)
  # end
end
