ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/bookmark_manager.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

require './app/models/link'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
