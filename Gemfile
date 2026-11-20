source 'https://rubygems.org'

ruby '>= 3.2.0'

gem 'rails', '~> 8.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.6'
# Use Puma as the app server
gem 'puma', '>= 7.0'
# Modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Hotwire's SPA-like page accelerator (successor of Turbolinks) [https://turbo.hotwired.dev]
gem 'turbo-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1'

gem 'cpf_cnpj'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'dotenv-rails'

gem 'active_model_serializers', '~> 0.10.16'

gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"

group :development, :test do
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'

  gem 'rspec-rails', '~> 8.0'

  gem 'shoulda-matchers', '~> 8.0'

  gem 'simplecov', require: false

  gem 'factory_bot_rails'

  gem 'faker'

  gem 'database_cleaner-active_record'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler'
  gem 'listen', '~> 3.9'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

gem "whenever", ">= 1.1", require: false
