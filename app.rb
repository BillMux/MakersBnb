require 'sinatra/base'
require 'dm-postgres-adapter'
require './models/user'
require './models/listing'

if ENV['ENV'] == 'test'
  DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase_test')
else
  DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase')
end

class Makersbnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/registered' do
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    erb :registered
  end

  get '/list-new' do
    erb :newlisting
  end

  post '/listed' do
    Listing.create(
      title: params[:title],
      location: params[:location],
      description: params[:description],
      guests: params[:guests],
      type: params[:type]
    )
    erb :listed
  end

  run! if app_file == $PROGRAM_NAME
end
