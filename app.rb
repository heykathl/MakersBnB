require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/request'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    user = User.find(params[:email])
    if user != nil
        puts "User already exists. Now redirecting to the login page."
        redirect '/login'
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

  authenticated_user = User.authenticate(params[:email], params[:password])
  if authenticated_user.email == params[:email]

    session[:user] = [authenticated_user]
   redirect '/spaces'
  else
      puts "login unsuccessful"
    
      redirect '/login'
    end
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    
    erb :space_new
  end

  post '/spaces/new' do

    @space = Space.create(
      name: params[:name], 
      description: params[:description], 
      price_per_night: params[:price_per_night], 
      available_from: params[:available_from], 
      available_to: params[:available_to], 
      email: session[:user][0].email)

      session[:space_id] = @space.id
      
    session[:available_from] = params[:available_from]
    session[:available_to] = params[:available_to]

    redirect '/spaces'
  end

  get '/spaces/:space_id' do
    session[:space_id] = params['space_id']
    
    @available_from = session[:available_from]
    @available_to = session[:available_to]
    erb :request_space
  end

  post '/requests' do
    Request.create(
      space_id: session[:space_id],
      start_date: params[:start_date], 
      end_date: params[:end_date]
    )
    redirect '/requests'
  end

  get '/requests' do
    @booking_requests = Request.all
    erb :requests
  end

  get '/request/:renter_id' do
    
  end


  run! if app_file == $0
end