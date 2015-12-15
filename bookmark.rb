require 'sinatra/base'
require './models/link.rb'
require 'byebug'

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
    linkey = Link.create(title: params[:title], url: params[:url])
    tagey = Tag.create(name: params[:tags])
    linkey.tags << tagey
    linkey.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
