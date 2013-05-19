source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'jquery-rails'
# Active admin
gem "activeadmin", :git => "git://github.com/gregbell/active_admin.git"
gem 'meta_search', '>= 1.1.0.pre'
gem "haml", "~> 4.0.2"
#authorization
gem "cancan"
#Images
gem 'carrierwave'
gem 'rmagick'

gem 'settingslogic'

# Validation helpers
gem 'date_validator'



group :production do
	gem 'pg'
end

group :development, :test do
	gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
	gem 'bootstrap-sass', '~> 2.2.2.0'
end