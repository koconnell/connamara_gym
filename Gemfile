source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'jquery-rails'
gem 'jruby-openssl'
gem 'json'
gem 'trinidad'
gem 'trinidad_logging_extension'
gem 'trollop'

group :test, :development do
  gem 'activerecord-jdbcsqlite3-adapter'
end

group :production_rackspace, :production, :postgres_test do
  gem 'activerecord-jdbcpostgresql-adapter'
end

group :test, :postgres_test, :development do
#  gem 'cucumber-rails', '1.1.1', :require => false
  gem "rspec-rails"
#  gem 'database_cleaner'
#  gem 'httparty'
#  gem 'json_spec'
#  gem 'selenium-webdriver', '~> 2.22.0'
#  gem 'headless'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'
end





#======================
# this stuff here is in Rails' default Gemfile

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
