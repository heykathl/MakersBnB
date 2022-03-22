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
    @user = User.create(params[:email], params[:password])
    session[:user] = @user
    redirect '/spaces'
  end

  post '/logout' do
    session[:user] = nil
    redirect '/'
  end

  get '/login' do

    erb :login
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