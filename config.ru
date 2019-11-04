$LOAD_PATH.unshift File.expand_path("./../lib", __FILE__)
require 'bundler'
Bundler.require

require "app/controllers/application_controller.rb"

use Rack::MethodOverride

run ApplicationController