
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, :type
  end

  get '/' do
    "home page"
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
    erb :new
  end

  post "/articles" do
    new_title = params[:title]
    new_content = params[:content]
    
    article1 = Article.create(title: new_title, content: new_content)
    article1.save
    redirect "articles/#{article1.id}"
  end

  get "/articles/:id" do
    art_id = params[:id]
    @article = Article.find(art_id)
    erb :show
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    new_title = params[:title]
    new_content = params[:content]

    article.update(title: new_title, content: new_content)

    redirect "/articles"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  delete '/articles/:id' do
    var_id = params[:id]

    Article.delete(var_id)

    redirect "/articles"
  end


end
