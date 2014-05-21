source 'https://rubygems.org'

ruby '2.1.2'

gem 'bourbon'
gem 'coffee-rails'
gem 'draper'
gem 'flutie'
gem 'haml-rails', '~> 0.4.0'
gem 'high_voltage'
gem 'jquery-rails'
gem 'neat'
gem 'paperclip'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'sass-rails'
gem 'select2-rails'
gem 'simple_form'
gem 'uglifier'
gem 'unicorn'

gem 'activeadmin',         github: 'mwean/active_admin', branch: 'add-custom-sort'
gem 'ransack'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'formtastic',          github: 'justinfrench/formtastic'

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'capybara-webkit', '>= 0.14.1'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'rack_session_access'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.5.7'
  gem 'rails_12factor'
end
