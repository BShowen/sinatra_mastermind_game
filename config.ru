require_relative "./config/environment.rb"
require_all './lib/app/models'
require "app/controllers/application_controller.rb"

use Rack::MethodOverride
run ApplicationController