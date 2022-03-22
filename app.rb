require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    if User.find(email: params[:email])
        flash[:error] = "Invalid user details"
        redirect '/'
    else 
        @user = User.create(email: params[:email],password: params[:password])
        session[:user] = @user
        redirect '/spaces'
    end
  end

  post '/logout' do
    session[:user] = nil
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if User.authenticate(email: params[:email],password: params[:password]) 
      redirect '/spaces'
    else
      flash[:error] = "login unsuccessful"
      redirect '/login'
    end
  end

  get '/requests' do

    erb :requests
  end

  get '/spaces' do
    
    erb :spaces
  end

  post '/spaces/new' do
    redirect '/spaces'
  end

  get '/spaces/:space_id' do
    erb :request_space
  end

  get '/request' do
    @request = params[request_id]
  end

  get '/request/:renter_id' do
    
  end


  run! if app_file == $0
end