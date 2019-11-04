
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  #CREATE
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article = Aticles.new(params)
    erb :show 
  end
  
  #READ
  get '/articles' do
    @articles = Ariticle.all
    erb :index
  end 
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end 
  
  #UPDATE
  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end
  
  patch '/articles/:id' do
    id = params["id"]
    new_params = {}
    old_article = Article.find(id)
    new_params[:name] = params["name"]
    new_params[:content] = params["content"]
    old_article.update(new_params)

    redirect "/posts/#{id}"
  end
  
  #DELDTE
  delete '/articles/:id' do
    @article = Article.find(params["id"])
    @article.destroy
    erb :index
  end 
end
