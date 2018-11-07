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
      @user = User.first(email: params[:email])
      session[:user_id] = @user.id
      session[:email] = @user.email
      redirect '/profile'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/profile' do
    @user = User.first(id: session[:user_id])
    @spaces = Space.all(user_id: session[:user_id])
    erb :profile
  end

  get '/edit-space/:id' do
    @space = Space.first(id: params[:id])
    erb :editspace
  end

  get '/delete-space/:id' do
    @space = Space.first(id: params[:id])
    @space.destroy
    redirect '/profile'
  end

  post '/edited/:id' do
    @space = Space.first(params[:id])
    @space.update(
      title: params[:title],
      location: params[:location],
      description: params[:description],
      guests: params[:guests],
      type: params[:type],
      user_id: session[:user_id]
    )
    redirect '/profile'
  end

  post '/registered' do
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    session[:user_id] = @user.id
    redirect '/profile'
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
    redirect '/profile'
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
      user_id: session[:user_id],
      space_id: params[:id]
      )
      redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
