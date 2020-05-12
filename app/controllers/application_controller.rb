
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "home page"
  end

  get "/articles" do
    erb :index
  end

  get "/articles/new" do
    erb :new
  end

  post "/articles" do
    title = params["title"]
    content = params["content"]
    article1 = Article.create(title: title, content: content)
    redirect "/articles"
  end
end
