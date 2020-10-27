
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

  post '/articles' do
    @new_article = Article.create(title: params[:title], content: params[:content])
    params[:id] = @new_article.id
    redirect '/articles/' + params[:id].to_s
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])

    params[:title] = @article.title unless params[:title] != ""
    params[:content] = @article.content unless params[:content] != ""

    @article.update(title: params[:title], content: params[:content])

    redirect '/articles/' + params[:id].to_s
  end

  delete '/articles/:id' do
    Article.find(params[:id]).destroy

    redirect '/articles'
  end
  
end 
