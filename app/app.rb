ENV["RACK_ENV"] ||= "development"
require_relative 'data_mapper_setup'
require 'sinatra/base'
require_relative 'models/links'
require_relative 'models/tags'
require_relative 'models/user'

class Bookmark < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect to '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tags = params[:tags].split(', ')
    tags.each do |current_tag|
      tag  = Tag.first_or_create(name: current_tag)
      link.tags << tag
    end
    link.save
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
