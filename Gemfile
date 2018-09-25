# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami',       '~> 1.2'
gem 'hanami-model', '~> 1.2'
gem 'pg'
gem 'rake'

group :development do
  gem 'hanami-webconsole'
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'byebug'
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'capybara'
  gem 'rspec'
end

group :production do
  gem 'puma'
end
