require 'sinatra/base'
require 'sinatra/reloader'
require './lib/Chitter'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

    erb :index
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