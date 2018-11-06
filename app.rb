require 'sinatra/base'
require 'dm-migrations'
require 'dm-postgres-adapter'
require './models/setup'
#
# if ENV['ENV'] == 'test'
#   DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase_test')
# else
#   DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase')
# end

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

  run! if app_file == $PROGRAM_NAME
end
