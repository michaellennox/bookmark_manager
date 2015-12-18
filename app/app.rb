ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'byebug'

class Bookmark < Sinatra::Base

  enable :sessions

  set :session_secret, 'super secret'
 helpers do
   def user_name
     User.first(email: session[:id]).email if User.first(email: session[:id])
   end
 end


  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:id] = params[:email]
    redirect to('/links')
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/add' do
    erb :'links/add'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    # tag = Tag.create(tags: params[:tags])
    # link.tags << tag
    params[:tags].split.each do |tag|
    link.tags << Tag.create(tags: tag)
  end
    link.save
    redirect '/links'
  end

  get '/tags/:tags' do
    tag = Tag.all(tags: params[:tags])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # get '/tags/bubbles' do
  #   @links = Link.all(tags: [tags: 'bubbles'])
  #   # @bubbles = @links.tags.map(&:tags)
  #   # @result = ""
  #   # @bubbles.select{|a| @result << a if a == 'bubbles' || 'Bubbles'}
  #   # # require 'byebug'; byebug
  #   erb :'links/index'
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
