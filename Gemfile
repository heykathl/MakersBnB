# frozen_string_literal: true

source "https://rubygems.org"

ruby '3.1.1'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'capybara'
gem 'pg'
gem 'bcrypt'

group :test do
  gem 'rspec'
  gem 'webrick'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

