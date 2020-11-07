
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/articles'
  end
    
  get '/' do
    "Welcome"
  end
       
  get '/articles' do
    @articles = Article.all 
    erb :index
  end
  
  get '/articles/new' do
    @article = Article.new
    erb :new
  end
  
  post '/articles' do
    @new_article = Article.create(params)
    # binding.pry
    id = @new_article.id
    redirect to "/articles/#{id}"
  end
  
  get '/articles/:id' do
    # binding.pry
    @article = Article.find_by(id: params["id"])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params["id"])
    # binding.pry
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params["id"])
    @article.title= (params[:title])
    @article.content= (params[:content])
    @article.save

    redirect to "/articles/#{id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params["id"])
    @article.destroy

    redirect to '/articles'
  end

end
