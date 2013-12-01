source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.14'
gem "paperclip", "~> 2.3"
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
   gem 'sqlite3','1.3.8'
end

group :production do
  gem 'pg','0.17.0'
  gem 'rails_12factor','0.0.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.6'
  gem 'coffee-rails', '3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '2.2.1'
end

gem 'jquery-rails','3.0.4'
# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.0.0'
# To use Jbuilder templates for JSON
gem 'jbuilder','1.5.1'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#suggested gems by Todd
gem 'factory_girl_rails','4.2.0'
gem 'rspec-rails','2.14.0'
gem 'devise', '3.1.0'
group :development do
#  gem 'ruby-debug-base19x'
#  gem 'ruby-debug-ide'
end
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
    :github => 'anjlab/bootstrap-rails'
gem 'bootstrap-sass', '~> 3.0.2.0'
gem 'bootstrap-will_paginate', '0.0.9'

group :test do
  gem 'selenium-webdriver','2.35.1'
  gem 'capybara','2.1.0'
  gem 'cucumber-rails','1.4.0',:require => false
end

gem 'database_cleaner','1.1.1'

gem 'rails_best_practices','1.14.0'

# Adding Faker gem to create fake data while testing
gem 'faker','1.2.0'

