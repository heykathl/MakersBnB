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

  post 'go_to_signup' do
    redirect '/'
  end

  post 'go_to_login' do
    redirect '/login'
  end

  post '/sign_out' do
    session[:user] = nil
    redirect '/login'
  end

  post '/go_to_requests' do
  redirect '/requests'
  end

  post '/go_to_spaces' do
    redirect '/spaces'
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
    redirect '/login' if session[:user] == nil
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
  
  get '/calendar' do
    session[:available_from] = @available_from
    session[:available_to] = @available_to
    erb :calendar
  end

  post '/calendar' do
  
    redirect '/request'
  end

 post '/requests' do
    Request.create(
      space_id: session[:space_id],
      start_date: params[:start_date], 
      end_date: params[:end_date],
      space_renter: session[:user][0].id
    )
    redirect '/requests'
  end

  get '/requests' do
    redirect '/login' if session[:user] == nil
    @booking_requests = Request.all
    @user_id = session[:user][0].id
    erb :requests
  end

  get '/requests/confirm' do
    @space_name = session[:space_name]
    erb :confirm_request
  end

  post '/requests/confirm' do
    space_id = session[:booking_requests].space_id
    start_date = 
    Request.confirmed(space_id: space_id, start_date: )
  end


  run! if app_file == $0
end