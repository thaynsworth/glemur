class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper

  ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :database => "glemur_db"
  })

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

end