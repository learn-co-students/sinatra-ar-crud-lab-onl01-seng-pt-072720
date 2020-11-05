
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
    
  get '/' do
    "Welcome"
  end
       
  get '/articles/new' do
    @article = Article.new
    erb :'/articles/new'
  end
    
  get '/articles' do
    @articles = Article.all 
    erb :'/articles/index'
  end
  
  post '/articles' do
    new_article = Article.create(params)
    id = new_article.id
    redirect :"/articles/#{id}"
  end
  
  # get '/articles/:id' do
  #   @article = Article.find(params[:id])
  #   id = new_article.id
  #   erb :'/articles/show'
  # end

  # get '/articles/:id/edit' do
  #   @article = Article.find(params[:id])
  #   id = new_article.id
  #   erb :'/articles/edit'
  # end

  # patch '/articles/:id' do
  #   id = params["id"]
  #   new_params = {}
  #   @article = Article.find(id)
  #   @article.update(params)

  #   redirect :'/articles/#{id}'
  # end

  # delete '/articles/:id' do
  #   Article.destroy(params[:id])

  #   redirect :'/articles'
  # end


end
