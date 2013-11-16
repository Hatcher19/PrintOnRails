source 'https://rubygems.org'
gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'activeadmin', :git => 'git://github.com/macfanatic/active_admin.git', branch: 'stable_batch_actions' # Active admin
gem 'meta_search', '>= 1.1.0.pre'
gem "haml", "~> 4.0.2"
gem 'cancan' #authorization
gem 'carrierwave' #Images
gem 'carrierwave_direct' #image background processing
gem 'rmagick' #images
gem 'fog' #images
gem 'figaro' #for secret information to not show up in my git
gem 'settingslogic'
gem 'date_validator' # Validation helpers
gem 'validates_email_format_of' # Validation helpers
gem 'taps' #pushes db from local to production
gem 'paper_trail' #auditing
gem 'inherited_resources' 
gem 'formtastic'
gem 'devise'
gem 'bcrypt-ruby', '3.1.1.rc1', :require => 'bcrypt'
gem 'best_in_place', github: 'bernat/best_in_place'  #in place editing, esp. for order index
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