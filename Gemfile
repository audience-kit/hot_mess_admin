ruby '2.4.1'

source 'https://rubygems.org'

gem 'rails'                                   # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

### Data Storage and Model Layer Concerns
gem 'typhoeus'
gem 'faraday'
gem 'faraday_middleware'

### View layer concerns
gem 'bower-rails'
gem 'sass-rails'                              # Use SCSS for stylesheets
gem 'uglifier'                                # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails'                            # Use CoffeeScript for .coffee assets and views
gem 'slim-rails'                              # Use slim-lang.org for view templates
gem 'jquery-rails'                            # Use jquery as the JavaScript library
gem 'turbolinks'                              # Turbolinks makes following links in your web application faster.

### External API and data sources
gem 'koala'
gem 'jwt'
gem 'google_places'

### Hosting server and other runtime components
gem 'puma'                                    # Use Puma as the app server

group :doc do
  gem 'sdoc'                                  # bundle exec rake doc:rails generates the API under doc/api.
end

group :development, :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'byebug'                                # Call 'byebug' anywhere in the code to get a debugger console
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'spring-commands-rspec'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rubocop'
end

group :development do
  gem 'web-console'                           # IRB console on exception pages or by using <%= console %> in views
  gem 'spring'                                # Spring speeds up development by keeping your application running.
end

group :production do
  gem 'rails_12factor'
end
