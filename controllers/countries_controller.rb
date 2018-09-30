class CountriesController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # INDEX
  get '/countries' do
    @title = "Index Page"
    @countries = Country.all

    erb :'countries/index'
  end
  # NEW
  get '/countries/new' do
    erb :'countries/new'
  end
  # SHOW
  get '/countries/:id' do
    id = params[:id].to_i
    @country = Country.find id
    erb :'countries/show'
  end
  # CREATE
  post '/countries' do

    country = Country.new

    country.name = params[:name]
    country.continent = params[:continent]
    country.main_language = params[:main_language]
    country.population = params[:population]

    country.save

    redirect '/countries'

  end
  # UPDATE
  put '/countries/:id' do
    id = params[:id].to_i

    country = Country.find id

    country.name = params[:name]
    country.continent = params[:continent]
    country.main_language = params[:main_language]
    country.population = params[:population]

    country.save

    redirect '/countries'

  end
  # DELETE
  delete '/countries/:id' do
    id = params[:id].to_i
    Country.destroy id
    redirect '/countries'
  end
  # EDIT
  get '/countries/:id/edit' do
    id = params[:id].to_i
    @country = Country.find id

    erb :'countries/edit'
  end

end
