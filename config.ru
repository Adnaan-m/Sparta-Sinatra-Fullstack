require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/Country.rb'
require_relative './models/City.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/cities_controller.rb'
require_relative './controllers/countries_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run Rack::Cascade.new([
  StaticController,
  CitiesController,
  CountriesController
])
