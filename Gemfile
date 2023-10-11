# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '3.2.2'
gem 'rails', '~> 7.0.7'

gem 'bootsnap', require: false
gem 'devil_fruit', '~> 0.2.0'
gem 'dotenv-rails'
gem 'gretel'
gem 'importmap-rails'
gem 'jbuilder'
gem 'meta-tags'
gem 'puma', '~> 5.0'
gem 'ransack'
gem 'rubocop', require: false
gem 'rubocop-capybara', require: false
gem 'rubocop-discourse'
gem 'rubocop-rails', require: false
gem 'ruby-openai'
gem 'sitemap_generator'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end
