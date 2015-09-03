source 'https://rubygems.org'
ruby '2.2.2' # used by Heroku

#-------------------------------------------------
#    Rails default gems
#-------------------------------------------------
gem 'rails',           '4.2.1'              # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'uglifier',     '>= 1.3.0'              # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'              # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails'                          # Use jquery as the JavaScript library
gem 'jbuilder',     '~> 2.0'                # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc',         '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use debugger
# gem 'debugger', group: [:development, :test]


#-------------------------------------------------
#    Added gems
#-------------------------------------------------
gem 'pg'                                    # Heroku uses postgres
gem 'net-http-digest_auth'                  # for digest authentication (re: firewall on research.tsadra.org)
# gem 'active_model_serializers'
gem 'platform-api'                          # provides access to Heroku's Platform API (for scaling dynos in rake task)

group :production do
  gem 'newrelic_rpm'                        # for monitoring site performance
  gem 'rails_12factor'                      # for Heroku deployment
  gem 'rails_stdout_logging'                # for capturing all logs on Heroku
  gem 'rails_serve_static_assets'           # enables Rails server to deliver assets on Heroku
end

group :development, :test do
  gem 'dotenv-rails'                        # for storing environment variables
  gem 'rspec-rails', '~> 3.0'               # for testing
  gem 'pry'                                 # for investigation & debugging
  gem 'byebug'                              # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'web-console', '~> 2.0'               # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring'                              # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end


