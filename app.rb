require 'sinatra/base'
require 'dm-migrations'
require 'dm-postgres-adapter'
require './models/setup'

class Makersbnb < Sinatra::Base

  enable :sessions

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
    session[:user_id] = @user.id
    erb :registered
  end

  get '/new-listing' do
    erb :newlisting
  end

  post '/listed' do
    Listing.create(
      title: params[:title],
      location: params[:location],
      description: params[:description],
      guests: params[:guests],
      type: params[:type],
      user_id: session[:user_id]
    )
    erb :listed
  end

  run! if app_file == $PROGRAM_NAME
end
