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

  get '/login' do
    erb :login
  end

  post '/login' do
    if User.log_in(params[:email], params[:password])
      @user = User.first(params[:email])
      session[:user_id] = @user.id
      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/login_successful' do
    erb :login_successful
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

  post '/new-listing' do
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
