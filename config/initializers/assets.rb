# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( logo.jpg )
Rails.application.config.assets.precompile += %w( carinsu.jpg )
Rails.application.config.assets.precompile += %w( healthinsu2.jpg )
Rails.application.config.assets.precompile += %w( bao-hiem-du-lich-bao-hiem-bao-viet-1349x500-opp.jpg )
Rails.application.config.assets.precompile += %w( application_dashboard.css )
Rails.application.config.assets.precompile += %w( application_dashboard.js )
Rails.application.config.assets.precompile += %w( gbh.png )
Rails.application.config.assets.precompile += %w( news.png )
Rails.application.config.assets.precompile += %w( bank.png )
Rails.application.config.assets.precompile += %w( handshake.png )
Rails.application.config.assets.precompile += %w( access.png )
Rails.application.config.assets.precompile += %w( bikeinsu.jpg )
Rails.application.config.assets.precompile += %w( otoinsu.jpg )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
