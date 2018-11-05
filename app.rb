require 'sinatra/base'
require 'dm-postgres-adapter'
require './models/user'

DataMapper.setup(:default, 'postgres://alfie@localhost/MakersBnBDatabase')

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    @user = User.create(
      :name => params[:name],
      :email => params[:email],
      :password => params[:password]
    )
    erb :signup
  end

  post '/registered' do
    erb :registered
  end

  run! if app_file == $0
end
