class CitiesController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # INDEX
  get '/cities' do
    @title = "Index Page"
    @cities = City.all_with_country

    erb :'cities/index'
  end
  # NEW
  get '/cities/new' do
    erb :'cities/new'
  end
  # SHOW
  get '/cities/:id' do
    id = params[:id].to_i
    @city = City.find_with_country id

    erb :'cities/show'
  end
  # CREATE
  post '/cities' do

    city = City.new

    city.name = params[:name]
    city.capital = params[:capital]
    city.place_of_interest = params[:place_of_interest]

    city.save

    redirect '/cities'

  end
  # UPDATE
  put '/cities/:id' do
    id = params[:id].to_i

    city = City.find id

    city.name = params[:name]
    city.capital = params[:capital]
    city.place_of_interest = params[:place_of_interest]

    city.save

    redirect '/cities'

  end
  # DELETE
  delete '/cities/:id' do
    id = params[:id].to_i
    City.destroy id
    redirect '/cities'
  end
  # EDIT
  get '/cities/:id/edit' do
    id = params[:id].to_i
    @city = City.find id

    erb :'cities/edit'
  end

end
