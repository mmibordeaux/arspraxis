source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Back
gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.5'
gem 'simple_form'
gem 'devise'
gem 'devise-i18n'
gem 'devise-bootstrap-views'
gem 'breadcrumbs_on_rails'
gem 'bootsnap', '>= 1.1.0', require: false

# Front
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap'
gem 'sassc-rails'
gem 'jquery-rails'

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
