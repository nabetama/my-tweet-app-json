require 'rubygems'
require 'json'
require 'twitter'

class Tweet
  def initialize(file)
    conf = JSON.parse(File.read file)
    Twitter.configure do |config|
      config.consumer_key       = conf["consumer_key"] 
      config.consumer_secret    = conf["consumer_secret"]
      config.oauth_token        = conf["oauth_token"]
      config.oauth_token_secret = conf["oauth_token_secret"]
    end
  end

  def update(tweet)
    return nil unless tweet
    begin
      Twitter.update(tweet.chomp)
    rescue => ex
      nil # todo
    end 
  end
end

t = Tweet.new("config.json")
t.update STDIN.gets.chomp
