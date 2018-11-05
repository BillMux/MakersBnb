require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'dm-postgres-adapter'
require 'rspec'
require './models/user'
require 'simplecov'
require 'simplecov-console'


Capybara.app = Makersbnb

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.include Rack::Test::Methods
  DataMapper::setup(:default, "postgres://alfie@localhost/MakersBnBDatabase")
  DataMapper.finalize
end

RSpec.configure do |config|
  config.include Capybara::DSL

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
