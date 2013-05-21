ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
# require 'pathname'
# APP_PATH = Pathname.new File.expand_path(File.join(File.dirname(__FILE__), '..'))

# # Require all ruby files in the spec/support folder
# Dir[APP_PATH + "spec" + "support" + "**" + "*.rb"].each {|f| require f}

# # Require all ruby files in the app/controllers folder
# #Dir[APP_PATH + "app" + "controllers" + "**" + "*.rb"].each {|f| require f}
