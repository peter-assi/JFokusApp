require 'appengine-rack'
AppEngine::Rack.configure_app(
    :application => 'jfokusapp',
    :precompilation_enabled => true,
    :sessions_enabled => true,
    :version => "1")

AppEngine::Rack.app.resource_files.exclude :rails_excludes
ENV['RAILS_ENV'] = AppEngine::Rack.environment

require ::File.expand_path('../config/environment',  __FILE__)
use Rails::Rack::LogTailer if ENV['RAILS_ENV'].eql? 'development'
use Rails::Rack::Static
run ActionController::Dispatcher.new
