
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
    @new_article = Article.create(title: params[:title], content: params[:content])
    @new_article.save
    
    erb :show
  end
  
  get '/articles' do
    @articles = Articles.all
    
    erb :index
  end
  
  get '/articles/:id' do
    @article = @articles.find(params[:id])
    
    erb :show
  end
end
