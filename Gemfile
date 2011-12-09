source 'http://rubygems.org'

gem 'rails', '3.1.1'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'twitter-bootstrap-rails'

gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

gem 'acts-as-taggable-on'
gem 'inherited_resources'
gem 'has_scope'

gem 'devise'
gem 'omniauth'

gem 'kaminari'
gem 'opinio', :git => "git://github.com/suchasurge/opinio.git"

group :test, :development do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'shoulda-matchers'
end
