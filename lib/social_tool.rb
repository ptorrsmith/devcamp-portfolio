module SocialTool

    # lib dir is good for loosely coupled functionality that I may want to later put into a gem
    
    def self.twitter_search search="#rubyonrails -rt" # class method
        # from https://github.com/sferik/twitter 
        # see .env file, twitter credentials from https://developer.twitter.com/en/apps/16138256
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
            config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
            config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
            config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
        end        

        client.search(search, lang: "en", result_type: "recent").take(6).collect do |tweet|
            "#{tweet.user.screen_name}: #{tweet.text}"
        end
    end
    
    
end