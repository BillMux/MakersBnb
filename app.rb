require 'sinatra/base'
require './models/users.rb'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    # @user = User.Create(
    #   :name => params[:name],
    #   :email => params[:email],
    #   :password => params[:password]
    # )
    erb :signup
  end

  post '/registered' do
    erb :registered
  end

  run! if app_file == $0
end
