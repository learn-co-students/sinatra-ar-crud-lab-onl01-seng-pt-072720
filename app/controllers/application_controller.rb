
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
    
  get '/' do

  end

  get '/articles/new' do
    @article = Article.new
    erb :'/articles/new'
  end

  post '/articles' do
    Article.create(params)
    redirect '/articles'
  end

  get '/articles' do
    @articles = Article.all 
    erb :'/articles/index'
  end

  get '/articles/:id' do
    @article = @articles.find(params[:id])
    erb :'/articles/show'
  end
end
