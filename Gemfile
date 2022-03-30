source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Back
gem 'rails', '~> 5'
gem 'rails-i18n'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'jbuilder', '~> 2.5'
gem 'simple_form'
gem 'devise'
gem 'devise-i18n'
gem 'devise-bootstrap-views'
gem 'breadcrumbs_on_rails'
gem 'cancancan'
gem 'country_select'
gem 'aws-sdk-s3', require: false
gem 'image_processing'

# Front
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap'
gem 'sassc-rails'
gem 'jquery-rails'
gem 'trix-rails', require: 'trix'
gem 'font-awesome-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'annotate'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
