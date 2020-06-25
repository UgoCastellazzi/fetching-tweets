require 'twitter'

class FetchingTweetsJob < ApplicationJob
  queue_as :default

  

  def perform(keyword)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_KEY_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    client.search("#{keyword.title}", result_type: "recent").take(1).collect do |tweet|
      Tweet.create!(
        handdle: tweet.user.screen_name,
        content: tweet.text,
        date: tweet.created_at,
        link: "https://twitter.com/i/web/status/#{tweet.id}",
        keyword_id: keyword.id
      )
    end
  end

end
