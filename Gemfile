# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'colorize'
gem 'terminal-table'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'simplecov-shields-badge', require: false
end

group :development, :test do
  gem 'pry'
  gem 'rubocop', require: false
end
