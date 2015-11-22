source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'rename'


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
# # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'



# Api gems
gem 'active_model_serializers', github: "rails-api/active_model_serializers", branch: '0-10-stable'
gem "devise"
gem 'geocoder'
gem "paperclip", "~> 4.3"
gem 'rack-cors'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Server scheduled Tasks
gem 'puma', '~> 2.15.3'
gem 'mocha'
gem 'whenever'



# Sabisu Stuff
gem 'sabisu_rails', github: "IcaliaLabs/sabisu-rails"
gem 'compass-rails', '~> 2.0.2'
gem 'furatto'
gem 'font-awesome-rails'
gem 'simple_form'


group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem "factory_girl_rails"
  gem 'ffaker'
end


group :test do
  gem "rspec-rails", "~> 3.1"
  gem "shoulda-matchers"
end


group :production do
  gem 'pg' # dont want sqlite in production
  gem 'rails_12factor', group: :production

  # gem 'unicorn' # make sure you follow installation instructions for this gem
  # gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  # gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  #
  # gem "factory_girl_rails"
  # gem 'ffaker'

end

ruby "2.2.1"
