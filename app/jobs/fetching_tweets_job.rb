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
    client.search("#{keyword.title} -rt -RT", result_type: "recent").take(10).collect do |tweet|
      if Tweet.exists?(link: "https://twitter.com/i/web/status/#{tweet.id}")
        return
      else
        if tweet.user.followers_count > 5000
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
  end

end
