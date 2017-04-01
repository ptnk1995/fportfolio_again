# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( static-user/main.css )
Rails.application.config.assets.precompile += %w( static-user/plugins.css )
Rails.application.config.assets.precompile += %w( static-user/themes.css )
Rails.application.config.assets.precompile += %w( user/plugins.js )
Rails.application.config.assets.precompile += %w( user/portfolio.js )
Rails.application.config.assets.precompile += %w( user/app.js )

Rails.application.config.assets.precompile += %w( admin/main.css )
Rails.application.config.assets.precompile += %w( admin/plugins.css )
Rails.application.config.assets.precompile += %w( admin/plugins.js )
Rails.application.config.assets.precompile += %w( admin/app.js )

Rails.application.config.assets.precompile += %w( devise.scss.css )
