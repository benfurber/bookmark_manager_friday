require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  before do
    @bookmarks = Bookmark.all
    @message = flash[:message]
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/add_to_database' do
    unless Bookmark.add(params[:title_field], params[:url_field])
      flash[:message] = 'Error. Link invalid - not added to database.'
    end

    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    flash[:message] = 'Bookmark deleted.'
    
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
