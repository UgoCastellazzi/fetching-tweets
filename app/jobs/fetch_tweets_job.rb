require 'twitter'
client = Twitter::REST::Client.new do |config|
end

def perform(keyword)
  client.search("#{keyword}", result_type: "recent").take(10).collect do |tweet|
    puts "#{tweet.user.screen_name}: #{tweet.text}"
  end
end
