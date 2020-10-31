
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new 
  end 

  post '/articles' do 
    param = params 
    @article = Article.create(param)

    redirect to "/articles/#{@article.id}"
  end 

  get '/articles/:id' do 
    id = params[:id] 
    @article = Article.find(id)

    erb :show
  end 

  get '/articles/:id/edit' do
    id = params[:id]
    @article = Article.find(id)
    erb :edit
  end

  patch '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    redirect to "/articles/#{id}"
    erb :show
  end

  delete '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    @article.delete
    redirect to '/articles'
    
    erb :index
  end

end