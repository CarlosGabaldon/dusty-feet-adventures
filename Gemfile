source 'https://rubygems.org'

ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta1', '< 5.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Puma as the app server
gem 'puma'

gem 'sdoc', '~> 0.4.0', group: :doc

# Rails app configuration using ENV. https://github.com/laserlemon/figaro
gem "figaro"

# XML parser
gem 'nokogiri'

# User authentication
gem "devise", :github => 'plataformatec/devise', :branch => 'master'

# Styling
gem 'bootstrap-sass', '~> 3.3.6'
gem 'font-awesome-rails', '~> 4.3'
gem 'simple_form'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => 'master'
  end
end

group :test do
  gem 'capybara', github: 'jnicklas/capybara'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver', '~> 2.45'
  gem 'database_cleaner', '~> 1.4'
  gem "codeclimate-test-reporter", require: nil
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
