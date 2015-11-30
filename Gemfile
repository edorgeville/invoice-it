source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.5'
gem 'rails-i18n'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

group :development, :test do
    gem 'sqlite3'
    gem 'better_errors'
    gem 'binding_of_caller', platforms: :mri
    gem 'spring'
end

group :production do 
    gem 'pg'
    gem 'rails_12factor'
    gem 'sentry-raven', git: 'https://github.com/getsentry/raven-ruby.git'
end

gem 'devise'
gem 'activeadmin', '~> 1.0.0.pre2'
gem 'active_admin_theme'