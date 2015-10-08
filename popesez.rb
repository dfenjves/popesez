require 'bundler'
Bundler.require
Dotenv.load
require 'pry'


#time for documentation
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

funny_accounts=["@ChelseaVPeretti", "@stephenathome","@MrGeorgeWallace", "@skullmandible", " @robhuebel", "@bridger_w", "@dril", "@sbellelauren", "@hellolanemoore", "@mattytalks", "@untresor"]

comedian = funny_accounts.sample

 joke = client.user_timeline(comedian).sample

 while joke.media? || joke.urls? || joke.retweet? || joke.hashtags?
  comedian = funny_accounts.sample
  joke = client.user_timeline(comedian).sample
  end

client.update(joke.full_text)
