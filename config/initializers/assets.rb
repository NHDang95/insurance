# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( logo.jpg )
Rails.application.config.assets.precompile += %w( promotion-01.png )
Rails.application.config.assets.precompile += %w( promotion-02.png )
Rails.application.config.assets.precompile += %w( promotion-03.png )
Rails.application.config.assets.precompile += %w( samsung.png )
Rails.application.config.assets.precompile += %w( slider-image-01.png )
Rails.application.config.assets.precompile += %w( slider-image-02.png )
Rails.application.config.assets.precompile += %w( slider-image-03.png )
Rails.application.config.assets.precompile += %w( mazda6.png )
Rails.application.config.assets.precompile += %w( vios.png )
Rails.application.config.assets.precompile += %w( santafe.png )
Rails.application.config.assets.precompile += %w( application_dashboard.css )
Rails.application.config.assets.precompile += %w( application_dashboard.js )
Rails.application.config.assets.precompile += %w( gbh.png )
Rails.application.config.assets.precompile += %w( news.png )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
