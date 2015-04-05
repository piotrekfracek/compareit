# Plugins
activate :livereload

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

# Paths
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
page 'templates/*', layout: false

# Angular Html5Mode
middleman_sitemap = sitemap
use Rack::Rewrite do
  rewrite %r{^[^.]*$}, -> (_, rack_env) do
    path_info = rack_env['PATH_INFO']
    middleman_sitemap.find_resource_by_path(path_info) ? path_info : '/'
  end
end

# CoffeeScript no-wrap bare mode
Tilt::CoffeeScriptTemplate.default_bare = true
# Muting Slim deprecated validations
Slim::Engine.disable_option_validator!

# Build-specific configuration
configure :build do
end

# Dev-specific configutation
configure :development do
  activate :livereload
end
