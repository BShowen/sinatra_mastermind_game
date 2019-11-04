require_relative "./config/environment.rb"
require 'app/models/play_game.rb'
require 'app/models/custom_enumerable.rb'
require 'app/models/instructions.rb'
require "app/controllers/application_controller.rb"

use Rack::MethodOverride
run ApplicationController