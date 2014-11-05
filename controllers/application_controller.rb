class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

end