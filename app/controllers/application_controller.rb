require_relative '../../config/environment'
require 'pry'

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
    @new_article = Article.create(title: params[:title], content: params[:content])
    @new_article.save
    
    redirect "/articles/#{@new_article.id}"
  end
  
  get '/articles' do
    @articles = Article.all
    
    erb :index
  end
  
  get '/articles/:id' do
    @article_id = params[:id]
    @article = Article.all.find(@article_id)
    
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article_id = params[:id]
    @article = Article.all.find(@article_id)
    erb :edit
  end
  
  patch '/articles/:id' do
    
  end
end
