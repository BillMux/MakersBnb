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

  post '/registered' do
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    session[:user_id] = @user.id
    erb :registered
  end

  get '/new-space' do
    erb :newspace
  end

  post '/listed' do
    Space.create(
      title: params[:title],
      location: params[:location],
      description: params[:description],
      guests: params[:guests],
      type: params[:type],
      user_id: session[:user_id]
    )
    erb :listed
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/:id' do
    @space = Space.first(:id => params[:id])
    erb :space
  end

  get '/:id/booking' do
    @bookings = Booking.all
    erb :booking
  end

  post '/:id/booking' do
    Booking.create(
      start_date: params[:start_date],
      end_date: params[:end_date],
      user_id: session[:user_id]
      )
      redirect '/:id/booking'
  end

  run! if app_file == $PROGRAM_NAME
end
