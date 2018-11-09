require 'sinatra/base'
require 'sinatra/flash'
require 'dm-migrations'
require 'dm-postgres-adapter'
require './models/setup'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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
      flash[:alert] = 'Please check you entered your info is correct.' if User.wrong_email(params[:email], params[:password])
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
    @bookings = Booking.all(user_id: session[:user_id])
    erb :profile
  end

  get '/edit-space/:id' do
    @space = Space.first(id: params[:id])
    puts params[:id]
    erb :editspace
  end

  get '/delete-space/:id' do
    @space = Space.first(id: params[:id])
    @space.destroy
    redirect '/profile'
  end

  post '/edited/:id' do
    @space = Space.first(id: params[:id])
    @space.update(
      title: params[:title],
      location: params[:location],
      description: params[:description],
      guests: params[:guests],
      type: params[:type],
      price: params[:price],
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
      price: params[:price],
      user_id: session[:user_id]
    )
    redirect '/profile'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :space
  end

  get '/booking/:id' do
    @bookings = Booking.all(space_id: params[:id])
    @disabled = if @bookings.empty?
                  []
                else
                  @bookings.map do |booking|
                    sy = booking.start_date.year
                    sm = booking.start_date.month
                    sd = booking.start_date.day
                    ey = booking.end_date.year
                    em = booking.end_date.month
                    ed = booking.end_date.day
                    { from: [sy, sm - 1, sd], to: [ey, em - 1, ed - 1] }
                  end
                end
    erb :booking
  end

  post '/booking/:id' do
    if session[:user_id].nil?
      flash[:login] = 'Please log in to make a booking!'
      redirect '/login'
    else
      Booking.create(
        start_date: params[:start_date],
        end_date: params[:end_date],
        user_id: session[:user_id],
        space_id: params[:id]
      )
      redirect '/profile'
    end
  end

  run! if app_file == $PROGRAM_NAME
end
