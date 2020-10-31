
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    data = params
    @article = Article.create(data)
    redirect to "/articles/#{@article.id}"
  end


  get '/articles' do
    @articles = Article.all
    erb :index
  end


  get '/articles/:id'  do
    @article = Article.find_by(id: params[:id])
    erb :show
  end


  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @new_data = params[:article]
    @article.update(@new_data)
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end



end
