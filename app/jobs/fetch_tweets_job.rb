require 'twitter'
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "zXdK9dgaSkUihiUzVLehOPh3y"
  config.consumer_secret     = "TcdmSoDr3fMTnCtUluGrFBh7k9l0zlWJNEf932mvCpjK5LIiiJ"
  config.access_token        = "1565624988-kNPG9im0aaZ0mi5jJf78Q0xaoieWFxe7UBueYI2"
  config.access_token_secret = "ctUO3Zv7pbAAot7VUOIuN5PFaGx0s4g666eV2oXAPHxbF"
end

def perform(keyword)
  client.search("#{keyword}", result_type: "recent").take(10).collect do |tweet|
    puts "#{tweet.user.screen_name}: #{tweet.text}"
  end
end