require_relative 'boot'

require 'rails/all'
# Load the dotenv gem
require 'dotenv'

# This tells dotenv to read the .env file and set the appropriate variables
Dotenv.load

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reporequest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
   $client = Twitter::REST::Client.new do |config|
            
          config.consumer_key        = ENV['TWITTER_API_KEY']
          config.consumer_secret     = ENV['TWITTER_API_SECRET']
          config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
          config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
  end
end
