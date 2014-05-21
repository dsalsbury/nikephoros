if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails'
  puts "Running coverage tool\n"
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'webmock/rspec'
require 'rack_session_access/capybara'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.infer_base_class_for_anonymous_controllers = false
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = 'random'
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
