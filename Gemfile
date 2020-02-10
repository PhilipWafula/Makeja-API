# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
ruby '2.5.7'
gem 'active_model_serializers'
gem 'devise'
gem 'doorkeeper', '~> 5.3'
gem 'jsonapi-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'phony_rails'
gem 'puma', '~> 4.2'
gem 'pundit'
gem 'rails', '~> 6.0.2'
gem 'rubocop'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
