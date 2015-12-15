require 'sinatra/base'
require './models/link.rb'

ENV["RACK_ENV"] ||= "development"

class Bookmark < Sinatra::Base

  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(title: params[:title], tags: params[:tags], url: params[:url])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
