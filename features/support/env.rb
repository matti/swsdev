# Generated by cucumber-sinatra. (Wed Feb 09 22:24:06 +0200 2011)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'heroku-sinatra-app')

require 'capybara'
require 'capybara/cucumber'

#require 'rspec'
#require 'rack/test'
#require 'webrat'

# Webrat.configure do |config|
#   config.mode = :rack
# end

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

Capybara.app = Sws

class SwsWorld
  include Capybara
  # include RSpec::Expectations
  # include RSpec::Matchers
  # include Webrat::Methods
  # include Webrat::Matchers
    
  # Webrat::Methods.delegate_to_session :response_code, :response_body

  # app = Capybara.app

  # def app
  #   Sinatra::Application
  # end
  
  # def app
  #     @app = Rack::Builder.new do
  #       run Sws
  #     end
  # end
  
  # include Rack::Test::Methods    
end


World do
  SwsWorld.new
end
