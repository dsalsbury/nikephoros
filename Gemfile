source 'https://rubygems.org'

ruby '2.1.2'

gem 'bourbon'
gem 'coffee-rails', '~> 4.0.1'
gem 'devise'
gem 'draper'
gem 'flutie'
gem 'haml-rails', '~> 0.5.3'
gem 'high_voltage'
gem 'jquery-rails'
gem 'neat'
gem 'paperclip', '~> 4.1.1'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '~> 4.1.0'
gem 'sass-rails', '~> 4.0.2'
gem 'select2-rails'
gem 'simple_form', '~> 3.0.2'
gem 'uglifier'
gem 'unicorn'
gem 'newrelic_rpm', '>= 3.5.7'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'ransack', '~> 1.2.3'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'formtastic',          github: 'justinfrench/formtastic'

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec', '~> 2.99.0.beta2'
  gem 'rspec-rails', '~> 2.99.0.beta2'
end

group :test do
  gem 'capybara', '~> 2.2.1'
  gem 'capybara-webkit', '>= 0.14.1'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers', '~> 2.6.1'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'rack_session_access'
end

group :staging, :production do
  gem 'rails_12factor'
end
