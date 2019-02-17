source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'
# ruby '2.5.3'

# Bundle edge Rails instgegeead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
# gem 'pg', '>= 0.18', '< 2.0'
gem 'pg', '~> 1.1', '>= 1.1.4'

# gem 'mysql2'


# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false


# GEMS installed by PTS during build course
gem 'friendly_id', '~> 5.2.4'

gem 'devise', '~> 4.5'

# required for bootstrap gem
# but already installed via rails gem dependency (see Gemfile.lock)
# gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'

# as per bootstrap-rubygem docs, different from Udemy video
gem 'jquery-rails'

gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'

# gem 'bootstrap', '4.0.0.alpha6'
gem 'bootstrap', '~> 4.2.1'

# normally don't publish all gems to rebygems.org unless want to share
# 
gem 'pts_devcamp_view_tool', git: 'https://github.com/ptorrsmith/pts_devcamp_view_tool'

gem 'petergate', '~> 2.0', '>= 2.0.1'

gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'

gem 'kaminari', '~> 1.1', '>= 1.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug', '~> 3.4'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

